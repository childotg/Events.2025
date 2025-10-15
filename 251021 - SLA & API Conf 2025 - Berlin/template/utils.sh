#!/bin/bash

# utils.sh - Utility scripts for managing Reveal.js presentations
# Part of Technical Talk Template

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Show help
show_help() {
    cat << EOF
${BLUE}Talk Template Utilities${NC}

Usage: ./utils.sh <command> [options]

${GREEN}Commands:${NC}

  ${BLUE}pdf${NC} <input.html> <output.pdf>
      Generate PDF from Reveal.js presentation (16:9 format)
      Example: ./utils.sh pdf slides/index.html presentation.pdf

  ${BLUE}validate${NC} <input.html>
      Check for common issues (overflow, broken links, etc.)
      Example: ./utils.sh validate slides/index.html

  ${BLUE}count${NC} <input.html>
      Count total number of slides
      Example: ./utils.sh count slides/index.html

  ${BLUE}open${NC} <input.html>
      Open slides in default browser
      Example: ./utils.sh open slides/index.html

  ${BLUE}serve${NC} [port]
      Start HTTP server for slide development (default port: 8000)
      Example: ./utils.sh serve 3000

  ${BLUE}check-deps${NC}
      Check if required dependencies are installed
      Example: ./utils.sh check-deps

  ${BLUE}help${NC}
      Show this help message

${GREEN}Examples:${NC}

  # Generate PDF
  ./utils.sh pdf slides/index.html output.pdf

  # Validate slides before presenting
  ./utils.sh validate slides/index.html

  # Start development server
  ./utils.sh serve

  # Open in browser
  ./utils.sh open slides/index.html

EOF
}

# Check dependencies
check_dependencies() {
    print_info "Checking dependencies..."

    local missing_deps=0

    # Check for npx (needed for decktape)
    if command -v npx &> /dev/null; then
        print_success "npx is installed ($(npx --version))"
    else
        print_error "npx is not installed (needed for PDF generation)"
        print_info "Install Node.js from: https://nodejs.org/"
        missing_deps=$((missing_deps + 1))
    fi

    # Check for Python (needed for HTTP server)
    if command -v python3 &> /dev/null; then
        print_success "python3 is installed ($(python3 --version))"
    else
        print_warning "python3 is not installed (needed for development server)"
    fi

    # Check for open/xdg-open (for browser opening)
    if command -v open &> /dev/null || command -v xdg-open &> /dev/null; then
        print_success "Browser opener available"
    else
        print_warning "No browser opener found (open/xdg-open)"
    fi

    if [ $missing_deps -eq 0 ]; then
        print_success "All critical dependencies are installed!"
    else
        print_error "Missing $missing_deps critical dependencies"
        return 1
    fi
}

# Generate PDF from HTML
generate_pdf() {
    local input_file="$1"
    local output_file="$2"

    if [ -z "$input_file" ] || [ -z "$output_file" ]; then
        print_error "Usage: ./utils.sh pdf <input.html> <output.pdf>"
        return 1
    fi

    if [ ! -f "$input_file" ]; then
        print_error "Input file not found: $input_file"
        return 1
    fi

    # Get absolute path
    local abs_path=$(cd "$(dirname "$input_file")" && pwd)/$(basename "$input_file")

    print_info "Generating PDF from $input_file..."
    print_info "Output: $output_file"

    # Generate PDF using decktape
    npx -y decktape reveal \
        "file://$abs_path" \
        "$output_file" \
        --size 1920x1080 \
        2>&1 | grep -v "npm warn"

    if [ -f "$output_file" ]; then
        local size=$(du -h "$output_file" | cut -f1)
        print_success "PDF generated successfully! (Size: $size)"
        print_info "Location: $(realpath "$output_file")"
    else
        print_error "PDF generation failed"
        return 1
    fi
}

# Count slides in presentation
count_slides() {
    local input_file="$1"

    if [ -z "$input_file" ]; then
        print_error "Usage: ./utils.sh count <input.html>"
        return 1
    fi

    if [ ! -f "$input_file" ]; then
        print_error "Input file not found: $input_file"
        return 1
    fi

    # Count <section> tags (each section is a slide)
    local count=$(grep -o "<section" "$input_file" | wc -l | xargs)

    print_info "Total slides in $input_file: ${GREEN}$count${NC}"
}

# Validate presentation
validate_slides() {
    local input_file="$1"

    if [ -z "$input_file" ]; then
        print_error "Usage: ./utils.sh validate <input.html>"
        return 1
    fi

    if [ ! -f "$input_file" ]; then
        print_error "Input file not found: $input_file"
        return 1
    fi

    print_info "Validating $input_file..."

    local issues=0

    # Check if file is valid HTML
    if grep -q "<!DOCTYPE html>" "$input_file"; then
        print_success "Valid HTML5 doctype"
    else
        print_warning "Missing HTML5 doctype"
        issues=$((issues + 1))
    fi

    # Check if Reveal.js is included
    if grep -q "reveal.js" "$input_file"; then
        print_success "Reveal.js included"
    else
        print_error "Reveal.js not found in file"
        issues=$((issues + 1))
    fi

    # Check for unclosed tags (basic check)
    local open_sections=$(grep -o "<section" "$input_file" | wc -l | xargs)
    local close_sections=$(grep -o "</section>" "$input_file" | wc -l | xargs)

    if [ "$open_sections" -eq "$close_sections" ]; then
        print_success "All <section> tags properly closed ($open_sections slides)"
    else
        print_error "Mismatched <section> tags (open: $open_sections, close: $close_sections)"
        issues=$((issues + 1))
    fi

    # Check for very long text (potential overflow)
    local long_lines=$(grep -o "<p[^>]*>.\{200,\}</p>" "$input_file" | wc -l | xargs)
    if [ "$long_lines" -gt 0 ]; then
        print_warning "Found $long_lines potentially long text blocks (may cause overflow)"
    else
        print_success "No obviously long text blocks detected"
    fi

    # Check for max slide input in navigation
    if grep -q 'max="[0-9]\+"' "$input_file"; then
        local max_nav=$(grep -o 'max="[0-9]\+"' "$input_file" | grep -o '[0-9]\+')
        if [ "$max_nav" -eq "$open_sections" ]; then
            print_success "Navigation menu max matches slide count"
        else
            print_warning "Navigation menu max ($max_nav) doesn't match slide count ($open_sections)"
            print_info "Update line: <input type=\"number\" ... max=\"$open_sections\">"
        fi
    fi

    if [ $issues -eq 0 ]; then
        print_success "Validation complete - no critical issues found!"
    else
        print_error "Validation found $issues issues"
        return 1
    fi
}

# Open slides in browser
open_slides() {
    local input_file="$1"

    if [ -z "$input_file" ]; then
        print_error "Usage: ./utils.sh open <input.html>"
        return 1
    fi

    if [ ! -f "$input_file" ]; then
        print_error "Input file not found: $input_file"
        return 1
    fi

    local abs_path=$(cd "$(dirname "$input_file")" && pwd)/$(basename "$input_file")

    print_info "Opening $input_file in browser..."

    # Try different browser openers based on OS
    if command -v open &> /dev/null; then
        # macOS
        open "$abs_path"
        print_success "Opened in default browser"
    elif command -v xdg-open &> /dev/null; then
        # Linux
        xdg-open "$abs_path"
        print_success "Opened in default browser"
    else
        print_error "Could not find browser opener (open/xdg-open)"
        print_info "Manual path: file://$abs_path"
        return 1
    fi
}

# Start HTTP server
start_server() {
    local port="${1:-8000}"

    print_info "Starting HTTP server on port $port..."
    print_info "Press Ctrl+C to stop"
    print_success "Server URL: http://localhost:$port"

    if command -v python3 &> /dev/null; then
        python3 -m http.server "$port"
    elif command -v python &> /dev/null; then
        python -m SimpleHTTPServer "$port"
    else
        print_error "Python not found. Cannot start HTTP server."
        return 1
    fi
}

# Main command dispatcher
main() {
    local command="$1"
    shift

    case "$command" in
        pdf)
            generate_pdf "$@"
            ;;
        validate)
            validate_slides "$@"
            ;;
        count)
            count_slides "$@"
            ;;
        open)
            open_slides "$@"
            ;;
        serve)
            start_server "$@"
            ;;
        check-deps)
            check_dependencies
            ;;
        help|--help|-h|"")
            show_help
            ;;
        *)
            print_error "Unknown command: $command"
            echo ""
            show_help
            return 1
            ;;
    esac
}

# Run main function
main "$@"
