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
| 3 | The Plateau | Technical deep dive: deployment challenges, Azure Files, performance tuning, app abuse, MinIO consistency checks, rabbit hole realization | 8 | Slides 18-25 (8 slides) | "What if we treated platform decisions as reversible?" |
| 4 | The Pivot Decision | Reversibility principle as foundation | 2 | Slides 26-27 (2 slides) | "We needed to act fast" |
| 5 | The Buy Phase | Vendor landscape (AWS S3, Oracle, third-party, self-hosted), selection criteria (no egress fees = reversibility, stable pricing, cost efficiency, performance trade-off), platform service philosophy (24/7 critical, N→10N scaling), zero-downtime migration strategy (4 steps), switch process, grace period & decommission | 9 | Slides 28-35 (8 slides) | "Now we had breathing room..." |
| 6 | The Learning Year | Why not go managed from day one? Platform as product philosophy, observation period, data lake scenario emergence, new requirements surface, pattern emerges (Make v2) | 7 | Slides 36-40 (5 slides) | "The rebuild: hybrid approach" |
| 7 | The Rebuild | Hybrid approach (software control + ops delegated), bare metal decision, switch v2 (seamless, no client notification), existential question (how many times?), the answer (as many as needed) | 5 | Slides 41-45 (5 slides) | "What did we learn from this journey?" |
| 8 | Lessons + CTA | 3 key takeaways: low exit costs enable learning, governance is business discovery, governance scales (code doesn't), CTA, final message | 4 | Slides 46-51 (6 slides) | Q&A session |

### Slide plan
- **Final slide count: 53 slides (0-52)** including opening/feedback images
- **Content slides: 51 slides** (average 52 seconds per slide)
- **Key additions from comprehensive review:**
  - **Keycloak technical deep dive** (slides 5-7): multi-tenant Realms, Container Apps, Azure AD integration, NGINX reverse proxy, over-engineering lessons
  - **Team discovery phase** (slides 9-12): teams already using MinIO independently (different versions), black box operations, insight to centralize
  - **MinIO infrastructure components** (slide 15): S3 API + Console, stateless server, erasure coding, Azure storage integration
  - **Extensive technical plateau narrative** (slides 18-25): deployment challenges (dual ingress), Azure Files tiers (Standard→Premium→Ultra), performance tuning (RAM/CPU vs disk I/O), app abuse patterns (recursive listings, uncached reads, unbatched operations), MinIO consistency checks (continuous at idle), dangerous question (disable checks for 10x gain?), rabbit hole realization
  - **Explicit reversibility principle** (slides 26-27): foundational concept connecting opening hook to buy decision and final takeaways
  - **Expanded Buy Phase** (slides 28-35): vendor landscape (AWS S3, Oracle, third-party, self-hosted MinIO), selection criteria with progressive reveals (no egress fees critical for reversibility, stable pricing, lower cost, performance trade-off), platform service philosophy (24/7 critical, N→10N client scaling, no maintenance windows), zero-downtime migration strategy (4-step visual: identify → prepare → replicate → switch), formal switch process (deprecation email, deadline), grace period & decommission timeline (stopped 1-2 weeks → grace period → clean decommission)
  - **Learning Year narrative** (slides 36-40): "Why not go managed from day one?" (because we didn't know what we needed), platform as product philosophy (clients see stability, team iterates), observation period (adoption grew, data lake scenario emerged), new requirements surface (very high file count, advanced logging/metrics/security/compliance), pattern emerges (Make v2 with ALL real requirements)
  - **Rebuild with hybrid approach** (slides 41-45): software control (MinIO) + operations delegated (third party handles servers/disks/RAID), bare metal decision (disk-intensive performance), switch v2 (painless, standardized endpoints, no client notification needed), existential question ("How many times can we do this?"), the answer ("As many times as needed - each iteration reveals truth"), journey summary (Build → Buy → Build v2 Hybrid = informed evolution)
  - **Refined takeaways** (slides 46-51): Takeaway 1 (low exit costs enable learning faster than perfect decisions, reversibility beats correctness), Takeaway 2 (platform governance = business needs discovery, not just tech control), Takeaway 3 (governance scales, code doesn't - organizational capability is the real platform), CTA (identify one reversible platform choice this week), final message (iteration = strategic learning, not indecision)
- Notes: Complete narrative arc from technical depth to philosophical insights. Section 6 (Learning Year) now addresses the implicit question "why not skip to managed?" with platform-as-product philosophy and learning necessity. Section 7 (Rebuild) emphasizes hybrid approach evolution and answers existential iteration question. Takeaways refined to eliminate redundancy and capture "governance scales" insight from narrative.

## Checklist
- [x] Total time fits slot
- [x] Each section has a goal
- [x] Alternates talk/demo sections
- [x] Transitions defined
