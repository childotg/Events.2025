# Technical Talk Template

This folder contains a structured template for creating technical talks with Reveal.js slides and comprehensive planning documents.

## Purpose

This template helps you systematically plan, design, and deliver technical presentations by breaking down the process into four key phases:

1. **Identity** - Define context, audience, and constraints
2. **Message & Narrative** - Craft core message and story arc
3. **Outline** - Structure content and timing
4. **Delivery** - Prepare speaker notes and operational details

## Structure

```
template/
├── 01_identity.md              # Talk context and audience
├── 02_message_and_narrative.md # Core message and story
├── 03_outline.md               # Content structure and timing
├── 04_delivery.md              # Speaker notes and delivery guide
├── slides/
│   └── index.html              # Reveal.js slide template
├── utils.sh                    # Utility scripts (PDF generation, etc.)
└── README.md                   # This file
```

## How to Use

### 1. Planning Phase (Markdown Files)

Work through the planning documents in order:

**Step 1: Identity** (`01_identity.md`)
- Fill in talk title, duration, event context
- Define primary audience and prerequisites
- Identify constraints and expected outcomes
- **Checklist:** Ensure objective is measurable, audience is specific

**Step 2: Message & Narrative** (`02_message_and_narrative.md`)
- Write one core message (max 20 words)
- Define 2-3 key takeaways
- Structure narrative: Problem → Tension → Solution → Impact
- Add supporting evidence (data, stories, demos)
- **Checklist:** Message understandable to non-experts, clear story progression

**Step 3: Outline** (`03_outline.md`)
- Break talk into 5-7 main sections
- Assign time budget to each section
- Plan slide count and support materials
- Define transitions between sections
- **Checklist:** Total time fits slot, each section has clear goal

**Step 4: Delivery** (`04_delivery.md`)
- Write opening hook (prefer future/scenario form)
- Bullet points for each section (not full sentences)
- Mark pauses, emphasis, audience interactions
- Prepare backup plans for demos or timing issues
- **Checklist:** Hook relevant, 2-4 bullets per section, clear CTA

### 2. Slide Creation (`slides/index.html`)

The template includes a single-file Reveal.js presentation with:

**Features:**
- ✅ 16:9 aspect ratio (1920x1080)
- ✅ Session header with slide number (customizable)
- ✅ Click-to-toggle navigation menu (jump to first/last, overview mode, go to slide number)
- ✅ Keyboard navigation (arrows, space, page up/down)
- ✅ Pre-defined CSS classes for common layouts

**Included Example Slides:**
1. **Title Slide** - Standard title + subtitle layout
2. **Hook Slide** - Large quote format with emphasis
3. **Content Slide** - Bullet points with supporting caption
4. **Comparison Slide** - Before/After side-by-side boxes

**CSS Classes Available:**

| Class | Purpose | Usage |
|-------|---------|-------|
| `.big-quote` | Large dramatic quotes | 2.5em, centered, light weight |
| `.quote-slide` | Medium quotes | 2em, italic, centered |
| `.emphasis` | Blue highlight for key words | Color: #3498db, bold |
| `.comparison` | Side-by-side before/after | Flex layout with gap |
| `.before` | Before state box | Red border, light red background |
| `.after` | After state box | Blue border, light blue background |
| `.small-text` | Supporting/caption text | 0.8em, gray color |

**Customization:**

1. **Change session name** (line 16):
   ```css
   .reveal .slide-number::before {
       content: "Your Session • ";  /* Change "Your Session" */
   }
   ```

2. **Update total slides** in navigation menu (line 206):
   ```html
   <input type="number" id="slideInput" placeholder="Slide #" min="1" max="4">
   ```

3. **Add slides:** Copy any `<section>...</section>` block and modify content

4. **Style adjustments:** All CSS is in the `<style>` block (lines 12-176)

### 3. Development Workflow

**Option A: Open directly in browser**
- Works for single-file HTML
- No HTTP server needed
- Simply double-click `index.html`

**Option B: Use HTTP server (for fetch-based modular slides)**
```bash
cd template/slides
python3 -m http.server 8000
# Open http://localhost:8000
```

### 4. Generate PDF

Use the provided utility script:

```bash
cd template
./utils.sh pdf slides/index.html output.pdf
```

Or manually:
```bash
npx -y decktape reveal file:///absolute/path/to/index.html output.pdf --size 1920x1080
```

## Design Philosophy

### Visual-First Approach
- **Minimal text:** One key message per slide
- **Large quotes:** Better than bullet points for emphasis
- **Visual diagrams:** CSS-based (not images) for flexibility
- **Speaker notes:** Keep detailed notes in delivery doc, not on slides

### Single-File vs Modular

**Single-File (This Template):**
- ✅ Easy to share (one file)
- ✅ Open directly in browser
- ✅ No build process
- ❌ Harder to collaborate on large presentations

**Modular (Alternative):**
- ✅ Each slide in separate file (content/01.html, etc.)
- ✅ Easy to edit specific slides
- ✅ Better for version control
- ✅ External CSS file
- ❌ Requires HTTP server for development
- ❌ Needs build script for production

For modular approach examples, see the project documentation or previous sessions if available.

## Best Practices

### Content Design
1. **One idea per slide** - If slide has >3 concepts, split it
2. **Visual hierarchy** - Use font size and color to guide attention
3. **Consistent formatting** - Use pre-defined CSS classes
4. **Test readability** - View from distance or small screen

### Timing
- **30-min talk:** ~15-20 slides (2 min/slide avg)
- **45-min talk:** ~20-30 slides (1.5-2 min/slide avg)
- **Rule of thumb:** Budget more time for complex slides (demos, diagrams)

### Delivery
- **Opening hook:** Use future/scenario questions ("What happens when...")
- **Transitions:** Explicitly connect sections ("Now that we've seen X, let's explore Y")
- **Pauses:** Build in silence after key quotes or questions
- **Backup plan:** Always have Plan B for demos and timing

## Utilities (`utils.sh`)

The utility script provides common operations:

```bash
# Generate PDF from slides
./utils.sh pdf slides/index.html output.pdf

# Validate slide count matches content
./utils.sh validate slides/index.html

# Open slides in browser
./utils.sh open slides/index.html

# Count total slides
./utils.sh count slides/index.html
```

Run `./utils.sh help` for full list of commands.

## Working with Claude Code

When starting a new session without context, provide Claude with:

1. **This README** - Full context on template structure
2. **Planning docs** - Your completed 01-04 markdown files
3. **Specific request** - What you need help with

**Example prompts:**

> "Read template/README.md and help me create slides for a 30-minute talk on [topic]"

> "I've filled out the planning docs in template/. Review them and suggest improvements before I start building slides"

> "Create 5 slides based on section 3 of my outline (template/03_outline.md)"

> "Generate a PDF of my slides and check for any overflow issues"

## Common Slide Patterns

### Pattern 1: Opening Hook
```html
<section>
    <p class="big-quote">"What happens when<br>your <span class="emphasis">key assumption</span><br>is challenged?"</p>
</section>
```

### Pattern 2: Bullet Points
```html
<section>
    <h2>Key Concept</h2>
    <div style="margin: 3em auto; max-width: 900px; text-align: left; font-size: 0.9em; line-height: 2;">
        <p style="margin: 1.5em 0;">→ First point</p>
        <p style="margin: 1.5em 0;">→ Second point with <span class="emphasis">emphasis</span></p>
        <p style="margin: 1.5em 0;">→ Third point</p>
    </div>
</section>
```

### Pattern 3: Quote + Attribution
```html
<section>
    <p class="quote-slide">"Insightful quote here"</p>
    <p style="text-align: center; margin-top: 2em; color: #7f8c8d; font-size: 0.7em;">— Author Name</p>
</section>
```

### Pattern 4: Comparison
```html
<section>
    <h2>Before vs After</h2>
    <div class="comparison">
        <div class="before">
            <h4>Before</h4>
            <p style="font-size: 0.75em; margin-top: 1.5em;">Content here</p>
        </div>
        <div class="after">
            <h4>After</h4>
            <p style="font-size: 0.75em; margin-top: 1.5em;">Content here</p>
        </div>
    </div>
</section>
```

## Troubleshooting

### Slides overflow / text cut off
- Reduce font size: Add `style="font-size: 0.8em;"` to container
- Reduce line height: Change `line-height: 2` to `1.6`
- Split slide: Break into multiple slides

### Navigation menu not working
- Ensure JavaScript is enabled
- Check browser console for errors
- Verify Reveal.js CDN is accessible

### PDF export issues
- Use absolute file paths: `file:///full/path/to/file.html`
- Check slide dimensions: Should be 1920x1080
- Increase timeout if many slides: `--timeout 120000`

### Hard refresh not showing changes
- **Mac:** Cmd + Shift + R
- **Windows/Linux:** Ctrl + Shift + R
- **Alternative:** Clear browser cache

## Version History

- **2025-10-14:** Initial template created
  - Single-file Reveal.js setup
  - 4-phase planning documents
  - Utility scripts for PDF generation
  - Navigation menu with slide jumping

## License

This template is free to use for technical talks and presentations.
Feel free to adapt and modify for your needs.

---

**Questions?** Check the CLAUDE.md file for guidance on working with AI assistants on your presentation.
