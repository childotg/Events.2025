# Content Outline
Purpose: define the logical sequence and pacing of the talk.

## How to fill
- Limit to 5–7 main sections.
- Assign time and support materials.
- One idea per slide.

## Template
| # | Section | Objective | Time (min) | Support (slides/demo) | Transition note |
|---|----------|------------|-------------|------------------------|-----------------|
| 1 | Opening + Context | Hook audience with "reversible decisions" principle and auth success story (incl. Keycloak deep dive) | 5 | Slides 1-7 (7 slides) | "Auth worked. So we thought storage would be easy..." |
| 2 | The Build Decision | Discovery phase (teams already using MinIO), make vs buy, MinIO infrastructure | 6 | Slides 8-16 (9 slides) | "Everything was going according to plan... For about 3 months..." |
| 3 | The Plateau | Technical deep dive: deployment challenges, Azure Files, performance tuning, app abuse, MinIO consistency checks, rabbit hole realization | 8 | Slides 18-27 (10 slides) | "What if we treated platform decisions as reversible?" |
| 4 | The Buy Phase | Principle of reversibility, vendor selection with low exit cost, zero-downtime migration | 7 | Slides 28-32 (5 slides) | "Now we had breathing room..." |
| 5 | The Learning Year | Team shift from operations to governance, hidden requirements revealed | 6 | Slides 33-37 (5 slides) | "With clarity, we could rebuild properly..." |
| 6 | The Rebuild | Build with knowledge not assumptions, informed iteration | 4 | Slides 38-41 (4 slides) | "What did we learn from this journey?" |
| 7 | Lessons + CTA | 3 key takeaways emphasizing low exit costs and iteration | 4 | Slides 42-46 (5 slides) | Q&A session |

### Slide plan
- **Final slide count: 49 slides (0-48)** including opening/feedback images
- **Content slides: 47 slides** (average 51 seconds per slide)
- **Key additions from review:**
  - Keycloak technical deep dive (slides 5-7)
  - Team discovery phase showing MinIO already in use (slides 9-12)
  - MinIO infrastructure components (slide 15)
  - Extensive technical plateau narrative (slides 18-25): deployment, performance tuning, app abuse, consistency checks, rabbit hole
  - Explicit "reversibility principle" slide (26) connecting hook to buy decision
- Notes: Section 3 (The Plateau) expanded significantly with technical depth: NGINX reverse proxy, Azure Files tiers, RAM/CPU vs disk I/O, application behavior problems, MinIO's consistency checks, and the "dangerous question" of disabling them. This is the narrative heart showing why pivot was necessary.

## Checklist
- [x] Total time fits slot
- [x] Each section has a goal
- [x] Alternates talk/demo sections
- [x] Transitions defined
