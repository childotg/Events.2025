# Claude Collaboration Guide

This document helps Claude (and other AI assistants) understand the project structure, workflow, and how to effectively collaborate on technical presentations.

## Quick Start for New Sessions

When starting a new conversation, Claude should:

1. **Read this file first** to understand the template structure
2. **Ask the user** what phase they're working on (planning vs slides)
3. **Check existing files** to understand progress (are planning docs filled? are slides created?)
4. **Propose next steps** based on current state

### First-Time Setup

If the user is starting from scratch:

```
User: "I need to create a technical talk"

Claude should:
1. Read CLAUDE.md (this file)
2. Read README.md for full context
3. Guide through 4-phase planning process
4. Ask: "Let's start with the Identity phase. What's your talk about?"
```

### Resume Existing Work

If files are partially completed:

```
User: "Continue working on my presentation"

Claude should:
1. Read all 4 planning docs (01-04 .md files)
2. Check slides/index.html for existing content
3. Summarize current state
4. Ask: "I see you've completed X and Y. Want to continue with Z?"
```

## Project Structure

```
template/
├── CLAUDE.md                   # This file - AI collaboration guide
├── README.md                   # Full documentation for humans
├── 01_identity.md              # Phase 1: Talk context
├── 02_message_and_narrative.md # Phase 2: Core message
├── 03_outline.md               # Phase 3: Content structure
├── 04_delivery.md              # Phase 4: Speaker notes
├── slides/
│   └── index.html              # Reveal.js presentation (single-file)
└── utils.sh                    # Utility scripts (PDF, validation)
```

## Template Philosophy

### Two-Track Approach

**Track 1: Planning (Markdown files)**
- Systematic preparation before creating slides
- Four sequential phases with checklists
- Ensures clarity of message and structure
- User fills TODO markers in each file

**Track 2: Production (HTML slides)**
- Visual presentation using Reveal.js
- Single-file approach (all inline)
- Minimal, visual-first design
- One idea per slide

### Key Principles

1. **Planning before production** - Complete markdown files before building slides
2. **Visual-first** - Large quotes, minimal text, CSS-based diagrams
3. **One idea per slide** - If >3 concepts, split the slide
4. **Inline everything** - No external dependencies (for easy sharing)
5. **Methodical** - Follow checklists, validate each phase

## Working with Users

### Phase 1: Identity (01_identity.md)

**Goal:** Define constraints and audience

**Claude should:**
- Ask clarifying questions if objective is vague
- Ensure audience is specific (not "developers" but "senior backend engineers")
- Push for measurable outcomes ("understand X" is vague, "able to implement Y" is better)
- Validate prerequisites match audience level

**Common issues:**
- Too broad audience ("anyone interested in tech")
- Unmeasurable objective ("learn about...")
- Missing constraints (room size, tech available)

**Checklist before moving to Phase 2:**
- [ ] Objective is measurable and specific
- [ ] Audience has clear role and seniority
- [ ] Format matches goal
- [ ] Constraints identified

### Phase 2: Message & Narrative (02_message_and_narrative.md)

**Goal:** Craft one core message and story arc

**Claude should:**
- Enforce 20-word max for core message
- Test: "Can a non-expert understand this message?"
- Ensure 2-3 takeaways (not 5+)
- Validate story progression: Problem → Tension → Solution → Impact
- Ask for concrete examples/evidence

**Common issues:**
- Core message is actually 3 messages combined
- Takeaways are too abstract ("think differently")
- No clear narrative arc (just list of facts)
- Missing evidence (data, stories, demos)

**Checklist before moving to Phase 3:**
- [ ] Message is <20 words and understandable
- [ ] 2-3 actionable takeaways
- [ ] Clear cause → effect story
- [ ] At least one concrete example

### Phase 3: Outline (03_outline.md)

**Goal:** Structure timing and flow

**Claude should:**
- Limit to 5-7 main sections (more = fragmented)
- Validate time budget matches total duration
- Suggest alternating talk/demo sections
- Define explicit transitions between sections
- Estimate slide count (rule of thumb: 1.5-2 min per slide)

**Common issues:**
- Too many small sections (9+ sections in 30 min)
- No time buffer for Q&A or overrun
- Transitions not defined ("then we'll talk about X")
- Slide count mismatch (30 slides for 20-min talk)

**Timing guidelines:**
- 30-min talk: 15-20 slides (2 min/slide avg)
- 45-min talk: 20-30 slides (1.5-2 min/slide avg)
- Demos take 2-3x longer than expected
- Always leave 5-10 min buffer

**Checklist before moving to Phase 4:**
- [ ] Total time fits slot (including buffer)
- [ ] Each section has clear goal
- [ ] Transitions defined
- [ ] Alternates content types (talk/demo/visual)

### Phase 4: Delivery (04_delivery.md)

**Goal:** Speaker notes and operational details

**Claude should:**
- Use bullet points only (no full sentences)
- Encourage future/scenario hooks ("What happens when...")
- Mark pauses explicitly ("PAUSE 3 seconds")
- Define backup plans (demo fails, timing issues)
- Ensure CTA is actionable within 7 days

**Common issues:**
- Full paragraphs instead of bullets
- Generic hook ("Today I'll talk about...")
- No backup plan for demos
- Vague CTA ("learn more online")
- Too many bullets per section (>4)

**Hook examples:**
- ❌ "Today I'll show you how to optimize databases"
- ✅ "What happens when your optimization makes things slower?"
- ✅ "Imagine your best practice becomes your bottleneck..."

**Checklist before creating slides:**
- [ ] Hook is relevant and engaging
- [ ] 2-4 bullets max per section
- [ ] At least one visible proof/demo
- [ ] Clear CTA within 7 days
- [ ] Backup plans defined

## Creating Slides (index.html)

### Development Workflow

**Option A: Direct open (recommended for this template)**
```bash
# Just open in browser
open slides/index.html
```

**Option B: HTTP server (if using fetch-based loading)**
```bash
cd slides
python3 -m http.server 8000
# Open http://localhost:8000
```

### Slide Design Guidelines

**1. One Idea Per Slide**
```html
❌ Bad: Multiple concepts on one slide
<section>
    <h2>Architecture</h2>
    <p>We use microservices, Kubernetes, and event-driven patterns...</p>
</section>

✅ Good: One concept
<section>
    <p class="big-quote">Event-driven architecture<br>decouples <span class="emphasis">when</span> from <span class="emphasis">what</span></p>
</section>
```

**2. Visual Hierarchy**
- Use `.big-quote` for dramatic statements (2.5em)
- Use `.quote-slide` for medium emphasis (2em, italic)
- Use `.emphasis` for highlighting specific words
- Use `.small-text` for supporting captions

**3. Minimal Text**
```html
❌ Bad: Paragraph on slide
<p>Our system processes millions of events per day using Apache Kafka...</p>

✅ Good: Key insight only
<p class="big-quote">"<span class="emphasis">Millions</span> of events.<br>Zero downtime."</p>
```

**4. CSS-Based Diagrams**

Use provided classes for common patterns:

```html
<!-- Before/After Comparison -->
<div class="comparison">
    <div class="before">
        <h4>Before</h4>
        <p>Monolithic deployment</p>
    </div>
    <div class="after">
        <h4>After</h4>
        <p>Independent services</p>
    </div>
</div>
```

### Available CSS Classes

| Class | When to Use | Font Size | Notes |
|-------|-------------|-----------|-------|
| `.big-quote` | Opening hooks, key insights | 2.5em | Centered, light weight |
| `.quote-slide` | Memorable quotes | 2em | Italic, centered |
| `.emphasis` | Highlighting key words | inherit | Blue color (#3498db), bold |
| `.comparison` | Before/after, comparisons | — | Flex layout, side-by-side |
| `.before` | Left side of comparison | — | Red border, light red bg |
| `.after` | Right side of comparison | — | Blue border, light blue bg |
| `.small-text` | Captions, supporting info | 0.8em | Gray color (#7f8c8d) |

### Common Slide Patterns

**Pattern 1: Opening Hook**
```html
<section>
    <p class="big-quote">"What happens when<br>your <span class="emphasis">best practice</span><br>becomes your bottleneck?"</p>
</section>
```

**Pattern 2: Key Insight**
```html
<section>
    <h2>The Insight</h2>
    <p class="quote-slide">"Decoupling enables iteration"</p>
    <p class="small-text">Not theoretical. Operational reality.</p>
</section>
```

**Pattern 3: Bullet Points (use sparingly)**
```html
<section>
    <h2>Three Truths</h2>
    <div style="margin: 3em auto; max-width: 900px; text-align: left; font-size: 0.9em; line-height: 2;">
        <p style="margin: 1.5em 0;">→ Iteration reveals truth</p>
        <p style="margin: 1.5em 0;">→ Governance <span class="emphasis">scales</span>, code doesn't</p>
        <p style="margin: 1.5em 0;">→ Decoupling enables learning</p>
    </div>
</section>
```

**Pattern 4: Comparison**
```html
<section>
    <h2>The Shift</h2>
    <div class="comparison">
        <div class="before">
            <h4>Build Everything</h4>
            <p style="font-size: 0.75em; margin-top: 1.5em;">Control, but slow learning</p>
        </div>
        <div class="after">
            <h4>Iterate & Evaluate</h4>
            <p style="font-size: 0.75em; margin-top: 1.5em;">Fast learning, strategic control</p>
        </div>
    </div>
</section>
```

**Pattern 5: Quote with Attribution**
```html
<section>
    <p class="quote-slide">"The system reveals what documentation hides"</p>
    <p style="text-align: center; margin-top: 2em; color: #7f8c8d; font-size: 0.7em;">— Production Experience</p>
</section>
```

### Customization Points

**1. Change session name** (line 14-18 in index.html):
```css
.reveal .slide-number::before {
    content: "Your Session • ";  /* ← Change this */
    color: #3498db;
}
```

**2. Update total slides in navigation** (line ~206):
```html
<input type="number" id="slideInput" placeholder="Slide #" min="1" max="4">
<!-- Change max="4" to your slide count -->
```

**3. Adjust colors** (in `<style>` block):
- Primary blue: `#3498db`
- Dark text: `#2c3e50`
- Gray text: `#7f8c8d`
- Borders: `#ecf0f1`

**4. Font sizes** (if text overflows):
- Reduce from `2.5em` to `2em` for `.big-quote`
- Use `style="font-size: 0.8em;"` inline

## Common Workflows

### Workflow 1: From Scratch

```
1. User: "I need to create a 45-min talk on [topic]"
   Claude:
   - Read CLAUDE.md + README.md
   - Guide through 01_identity.md
   - Ask questions to fill TODOs

2. Complete Phase 1 → Validate checklist → Move to Phase 2

3. Complete Phase 2 → Validate checklist → Move to Phase 3

4. Complete Phase 3 → Validate checklist → Move to Phase 4

5. Complete Phase 4 → Start creating slides

6. For each section in outline:
   - Create 3-5 slides
   - Follow one-idea-per-slide rule
   - Use provided CSS classes
   - Test readability

7. Generate PDF: ./utils.sh pdf slides/index.html output.pdf
```

### Workflow 2: Review Existing Work

```
1. User: "Review my planning docs"
   Claude:
   - Read all 4 .md files
   - Check each checklist
   - Identify gaps or inconsistencies
   - Suggest improvements

2. Provide specific feedback:
   - "Core message is 35 words, should be <20"
   - "Section 3 has 15 min but outline shows 8 min"
   - "No backup plan for demo in delivery notes"
```

### Workflow 3: Slides from Outline

```
1. User: "Create slides for section 3"
   Claude:
   - Read 03_outline.md for section 3
   - Read 04_delivery.md for speaker notes
   - Check time budget (e.g., 8 min = 4-5 slides)
   - Create slides using appropriate patterns
   - Use visual-first approach (quotes > bullets)
```

### Workflow 4: Refine Slides

```
1. User: "Slide 7 has too much text"
   Claude:
   - Read current slide content
   - Identify core message
   - Suggest splitting into 2 slides OR
   - Rewrite as big-quote format OR
   - Use comparison layout
```

## Troubleshooting

### Planning Phase Issues

**Issue: Vague objective**
```
❌ "Teach people about microservices"
✅ "Enable attendees to evaluate when to decompose a monolith"
```

**Issue: Too many takeaways**
```
❌ 7 takeaways listed
✅ 3 takeaways max (more = diluted message)
```

**Issue: No time buffer**
```
❌ 30-min slot, 30 min of content planned
✅ 30-min slot, 23 min content + 7 min buffer
```

### Slide Issues

**Issue: Text overflow**
```css
/* Solution 1: Reduce font size */
<p style="font-size: 0.8em;">...</p>

/* Solution 2: Split slide */
One concept → Two slides

/* Solution 3: Use quote format */
Paragraph → Big quote with emphasis
```

**Issue: Navigation menu not opening**
```html
<!-- Check line ~206: slideNumber must be enabled -->
Reveal.initialize({
    slideNumber: 'c/t',  // Must be enabled
    ...
});
```

**Issue: Slides not counting correctly**
```html
<!-- Update max value in navigation input -->
<input ... max="30">  <!-- Change to actual slide count -->
```

### PDF Export Issues

```bash
# Issue: "Cannot find decktape"
npm install -g decktape

# Issue: "File not found"
# Use absolute path:
./utils.sh pdf "$(pwd)/slides/index.html" output.pdf

# Issue: Slides cut off in PDF
# Check slide dimensions (should be 1920x1080)
npx decktape reveal file:///path/to/index.html output.pdf --size 1920x1080
```

## Claude's Responsibilities

### DO:

1. **Read context first** - Always read CLAUDE.md, README.md, and existing files
2. **Follow checklists** - Validate each phase before moving to next
3. **Use TodoWrite** - Track multi-step tasks (creating 20 slides, reviewing all docs)
4. **Ask clarifying questions** - Don't assume; make user explicit
5. **Suggest improvements** - If something is vague or inconsistent
6. **Test after changes** - Validate slide count, test in browser
7. **Use visual-first patterns** - Prefer big-quote over paragraphs
8. **Provide specific feedback** - Line numbers, concrete examples

### DON'T:

1. **Don't skip planning** - Never jump straight to slides without completing phases
2. **Don't create walls of text** - One idea per slide, always
3. **Don't use bullet points by default** - Try quote format first
4. **Don't ignore checklists** - They catch common issues
5. **Don't assume understanding** - Ask if objective/audience is unclear
6. **Don't batch slide updates** - Mark each todo completed as you go
7. **Don't use external images** - CSS-based diagrams only
8. **Don't forget to update slide count** - In navigation menu and utils

## File Editing Rules

### Markdown Files (01-04)

**When editing:**
- Replace `<!-- TODO -->` with user's content
- Keep formatting consistent
- Don't remove checklists
- Add notes in "Notes:" sections if provided

**Example:**
```markdown
Before:
- Title: <!-- TODO -->

After:
- Title: Platform Engineering Beyond Build-vs-Buy
```

### HTML File (slides/index.html)

**When adding slides:**
1. Copy existing `<section>...</section>` block
2. Modify content using provided CSS classes
3. Update `max="X"` in navigation input (line ~206)
4. Test in browser

**When modifying styles:**
1. All CSS is in `<style>` block (lines 12-176)
2. Don't add external stylesheets
3. Keep inline for portability

**Example:**
```html
<!-- Add new slide after existing ones -->
<section>
    <p class="big-quote">New <span class="emphasis">insight</span> here</p>
</section>
```

## Best Practices for Collaboration

### Starting a Session

**Good opening:**
```
Claude: "I've read the template structure. I see you have:
- Identity doc: 80% complete (missing constraints)
- Message doc: Not started
- Outline: Not started
- Slides: Template only

Want to finish identity first, or jump to a specific task?"
```

**Bad opening:**
```
Claude: "How can I help you today?"
(No context, user has to explain everything)
```

### Providing Feedback

**Good feedback:**
```
Claude: "Looking at 02_message_and_narrative.md:8
Your core message is 34 words. Let's compress to <20:

Current: 'Platform engineering requires iterating between build, buy, and managed options...'

Suggested: 'Iteration between build, buy, and managed services reveals strategic clarity'

That's 11 words. Thoughts?"
```

**Bad feedback:**
```
Claude: "Core message is too long."
(Not specific, no line number, no suggestion)
```

### Creating Slides

**Good process:**
```
Claude: "Creating slides for Section 3 (The Problem):
- Time budget: 6 minutes
- Slide count: 3-4 slides
- Key message: 'Initial solution worked, then plateaued'

Slide 1: Opening question (big-quote)
Slide 2: Performance chart (Chart.js)
Slide 3: The realization (quote-slide)

Should I proceed?"
```

**Bad process:**
```
Claude: "Here are 10 slides for section 3."
(No validation, no checking time budget, too many slides)
```

## Advanced Features

### Chart.js Integration

For data visualization, use Chart.js (already included):

```html
<section>
    <h2>Performance Over Time</h2>
    <canvas id="myChart" width="800" height="400"></canvas>
</section>

<script>
// In Reveal.initialize() callback:
const ctx = document.getElementById('myChart').getContext('2d');
new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Month 1', 'Month 2', 'Month 3', 'Month 4'],
        datasets: [{
            label: 'Performance',
            data: [65, 78, 82, 83],
            borderColor: '#3498db',
            tension: 0.4
        }]
    }
});
</script>
```

### Custom Animations

Use Reveal.js fragments for progressive disclosure:

```html
<section>
    <p class="big-quote">Three Key Insights</p>
    <div style="margin-top: 2em;">
        <p class="fragment">1. Iteration is learning</p>
        <p class="fragment">2. Governance scales</p>
        <p class="fragment">3. Decoupling enables change</p>
    </div>
</section>
```

### Speaker Notes

Add presenter notes (visible in Reveal.js speaker view):

```html
<section>
    <p class="big-quote">Core Message</p>
    <aside class="notes">
        - Pause 3 seconds after showing slide
        - Emphasize the word "learning"
        - Reference demo from section 2
    </aside>
</section>
```

Press `S` during presentation to open speaker view.

## Questions to Ask User

### At Session Start

1. "Are you starting a new talk or continuing existing work?"
2. "Have you filled out any of the planning documents (01-04)?"
3. "Do you have a specific section you want to focus on?"

### During Planning Phase

1. "Who will be in the audience? What's their experience level?"
2. "What should attendees be able to do after your talk?"
3. "Can you give me a concrete example or story for this point?"
4. "How will you know if this talk succeeded?"

### During Slide Creation

1. "Is this slide trying to convey multiple ideas? Should we split it?"
2. "Would this work better as a big quote or a comparison layout?"
3. "Do you have data/evidence to show here, or is this conceptual?"
4. "What's the one thing you want people to remember from this slide?"

### Before Finalizing

1. "Have you tested the presentation on a projector or large screen?"
2. "Do you want me to generate a PDF for sharing?"
3. "Should we review timing one more time?"
4. "Any backup plans needed for demos or technical content?"

## Version Compatibility

- **Reveal.js**: 5.0.4 (CDN loaded)
- **Chart.js**: 4.4.0 (CDN loaded)
- **Browser support**: Modern browsers (Chrome, Firefox, Safari, Edge)
- **PDF export**: decktape 3.x

## Summary Checklist for Claude

Before starting work, Claude should:

- [ ] Read CLAUDE.md (this file)
- [ ] Read README.md for full context
- [ ] Check status of planning docs (01-04)
- [ ] Check status of slides/index.html
- [ ] Ask user what phase they're in
- [ ] Propose next steps based on current state
- [ ] Use TodoWrite for multi-step tasks
- [ ] Validate checklists before phase transitions
- [ ] Test slides after modifications
- [ ] Provide specific, actionable feedback

## Getting Help

If Claude encounters issues:

1. **Check README.md** - Full documentation for all features
2. **Review file structure** - Ensure all files in correct locations
3. **Validate HTML** - Common issue: unclosed tags
4. **Check browser console** - JavaScript errors visible there
5. **Test with simple slide** - Isolate issue by removing complex content

---

**Last updated**: 2025-10-14
**Template version**: 1.0
**Maintained for**: Claude Code and compatible AI assistants
