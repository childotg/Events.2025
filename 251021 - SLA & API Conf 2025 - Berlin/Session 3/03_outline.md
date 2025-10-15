# Content Outline
Purpose: define the logical sequence and pacing of the talk.

## How to fill
- Limit to 5–7 main sections.
- Assign time and support materials.
- One idea per slide.

## Template
| # | Section | Objective | Time (min) | Support (slides/demo) | Transition note |
|---|----------|------------|-------------|------------------------|-----------------|
| 1 | Opening: Why Teams Choose ACA | Validate ACA adoption reasons—serverless, simplicity, speed; hook with "but what if..." | 3 | 3 slides (hook question, ACA benefits, the "what if" tension) | "Let me show you why ACA is attractive in practice..." |
| 2 | Demo 1: ACA Deploy (The Easy Part) | Show ACA deployment is genuinely easy—validate why teams adopt it | 4 | Live demo + 2 slides (setup, deploy, celebrate simplicity) | "This is great. Until... requirements change. Let me show you a real scenario..." |
| 3 | The Migration Scenario | Real case: compliance requires on-prem; show the lock-in problem when migrating | 5 | 4 slides (scenario setup, YAML incompatibility, migration cost, "we need an escape hatch") | "So how do we get out? Here's the pattern..." |
| 4 | The Escape Hatch Pattern | Introduce bidirectional approach: maintain K8s manifests as source of truth, ACA as deployment target | 5 | 5 slides (pattern overview, K8s as source, bidirectional flow, AI as enabler) | "But you might ask: shouldn't we use a standard?" |
| 4.5 | What About Standards? (OAM Challenge) | Challenge meta-language approach (OAM), position K8s + AI as pragmatic alternative | 3 | 4 slides (OAM question, OAM example, meta-language trap, why AI is better) | "Let me prove this works—Demo 2..." |
| 5 | Demo 2: ACA → K8s Migration (AI) | Use AI to generate K8s manifests FROM existing ACA deployment; deploy to K8s cluster | 6 | Live demo + 3 slides (AI prompt, generated K8s, validate on cluster) | "Now the round-trip—what if we want to go back to ACA from K8s?" |
| 6 | Demo 3: K8s → ACA Round-Trip | Show K8s manifests can generate ACA when needed; prove bidirectional works | 5 | Live demo + 2 slides (K8s→ACA prompt, validation, "source of truth" concept) | "Now you understand the pattern. When should you use it?" |
| 7 | How to Use ACA Safely | Decision matrix: when ACA makes sense, when to migrate, OAM vs K8s+AI comparison | 5 | 4 slides (decision matrix with OAM row, real recovery journey, CTA, resources) | "Questions?" |
| 8 | Q&A | Answer audience questions | 7 | — | — |

### Slide plan
- Estimated slide count: 28 slides (excluding demo screens)
  - Section 1: 3 slides
  - Section 2: 2 slides (+ live demo terminal/browser)
  - Section 3: 4 slides
  - Section 4: 5 slides
  - **Section 4.5: 4 slides (NEW - OAM challenge)**
  - Section 5: 3 slides (+ live walkthrough of files)
  - Section 6: 2 slides (+ live Copilot demo)
  - Section 7: 4 slides (+ 2 new rows in decision matrix)
- Notes: One idea per slide, visual-first approach (big quotes for hooks, comparison layouts for before/after, CSS diagrams for architecture), minimal bullet points, demos run outside slide deck

## Checklist
- [x] Total time fits slot (43 min total: 3+4+5+5+3+6+5+5 = 36 min content + 7 min Q&A, fits 45-min slot with 2 min buffer)
- [x] Each section has a goal (validate ACA → show ease → reveal lock-in → escape pattern → recovery demo → round-trip demo → safe usage)
- [x] Alternates talk/demo sections (talk → demo → talk → talk → demo → demo → talk, 3 demos with clear progression: adopt → escape → round-trip)
- [x] Transitions defined (explicit bridges emphasizing journey: ease → problem → recovery → safety)
