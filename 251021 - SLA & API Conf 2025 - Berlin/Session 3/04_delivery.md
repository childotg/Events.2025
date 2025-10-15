# Delivery and Speaker Notes
Purpose: guide live delivery and timing.

## How to fill
- Use bullet points, not full sentences.
- Mark pauses, emphasis, and interactions.
- Include fallback options for demo or timing issues.

## Template
### Opening hook (prefer future or scenario form)
- "Who here uses or is evaluating Azure Container Apps?"
- PAUSE 3 seconds - show of hands
- Acknowledge: "Great. ACA is genuinely attractive—serverless, simple, fast."
- "And who here has thought: what if requirements change and I need to move this?"
- PAUSE 2 seconds
- "Today: how to USE ACA safely—with an escape hatch ready from day one"

### Key points by section
1. **Opening: Why Teams Choose ACA**
   - ACA offers genuine benefits: serverless, no K8s complexity, scale-to-zero
   - Many teams adopt for legitimate reasons (speed, cost, simplicity)
   - Question: "Who's running containers in production?" (gauge maturity)
   - Emphasize: "ACA is good. But what if..."

2. **Demo 1: ACA Deploy (The Easy Part)**
   - Show clean ACA YAML: simple, declarative
   - Deploy with `az containerapp create --yaml` → live in seconds
   - Celebrate: "This is why teams choose ACA"
   - PAUSE: "Now imagine: compliance requires on-prem deployment..."

3. **The Migration Scenario**
   - Real case: 3 months into ACA, new requirement (compliance/edge/multi-cloud)
   - Show YAML incompatibility: `kind: ContainerApp` ≠ `kind: Deployment`
   - Migration cost: rewrite Deployment, Service, Ingress, test behavioral differences
   - "We're locked in. We need an escape hatch."

4. **The Escape Hatch Pattern**
   - Core idea: maintain K8s manifests as source of truth
   - ACA becomes deployment target, not source definition
   - Bidirectional transformation with AI: ACA ⇄ K8s
   - Emphasize: "You can USE ACA, just keep the parachute"

4.5 **What About Standards? (OAM Challenge)**
   - "You might ask: shouldn't we use OAM?"
   - Show OAM example: looks clean, platform-agnostic
   - The meta-language trap:
     - Superset complexity (must support all clouds)
     - Learning curve (new spec, evolving)
     - Tooling immaturity (ACA not natively supported)
     - Double abstraction (App → OAM → K8s → Container)
   - Key phrase: "You're learning a language to describe another language"
   - Why AI is better:
     - K8s is the de-facto standard (everyone knows it)
     - AI does dirty work (generates when needed)
     - Pay-as-you-go complexity
     - Future-proof (AI improves over time)
   - Key phrase: **"Pragmatic over purist"**
   - PAUSE: "Let me prove this works..."

5. **Demo 2: ACA → K8s Migration (AI)**
   - Start with ACA YAML from Demo 1
   - Prompt Copilot: "Generate standard K8s manifests from this ACA ContainerApp"
   - Show generated: Deployment, Service, Ingress
   - Deploy to K8s cluster (AKS/minikube) → works identically
   - "Escape hatch activated in minutes, not weeks"

6. **Demo 3: K8s → ACA Round-Trip**
   - Take K8s manifests from Demo 2
   - Prompt Copilot: "Generate ACA YAML from these K8s manifests"
   - Show round-trip works: K8s ⇄ ACA bidirectional
   - Emphasize: "Keep K8s as source of truth, generate ACA when needed"
   - PAUSE: "This is how you use ACA without lock-in"

7. **How to Use ACA Safely**
   - When to use ACA: dev/staging serverless, rapid prototyping, cost optimization
   - When to migrate: compliance, multi-cloud, edge requirements emerge
   - How to maintain both: K8s manifests as source, AI to generate ACA
   - **Key workflow**: Always edit K8s manifests, generate ACA YAML when deploying to Azure
   - Real recovery: adopted ACA Month 1-3, hit wall Month 4, escaped Week 1-2

### Audience interaction
- Questions to ask:
  - "Who uses or is evaluating ACA?" (opening, validate they're the right audience)
  - "Who's running containers in production?" (section 1, gauge maturity)
  - "Who's evaluating multi-cloud or hybrid strategies?" (section 3, positive framing)
  - "Who uses GitHub Copilot or similar AI tools?" (section 5, relate to practice)
- Demo moments:
  - Live deploy to ACA (section 2, ~3 min, celebrate ease)
  - AI generate K8s from ACA (section 5, ~4 min, the escape)
  - AI round-trip ACA from K8s (section 6, ~3 min, prove bidirectional)

### Closing / Call to action
- "Within next 2 weeks:"
- "If ALREADY on ACA: use AI to generate K8s manifests as backup (your escape hatch)"
  - **Key point**: "Going forward, edit K8s manifests and generate ACA when deploying to Azure"
  - This makes K8s the source of truth even if you keep using ACA
- "If STARTING new project: create K8s manifests first, generate ACA with AI when needed"
  - K8s is source of truth from day one
- "For both: keep K8s as source of truth, test bidirectional transformation works"
- "Validate: deploy K8s to any cluster (AKS, minikube, on-prem), deploy to ACA from same source"
- Resources slide: GitHub repo with bidirectional examples (ACA ⇄ K8s), AI prompt templates, decision matrix

### Operational notes
- Timing per section: See 03_outline.md (3-8 min per section, 38 min content + 7 min Q&A)
- Planned pauses:
  - After opening hook (3 sec, let tension land)
  - After Demo 1 success (2 sec, "This is the promise working")
  - Before AI demo (2 sec, "Previously 2-3 hours...")
  - Before decision matrix (2 sec, transition from tactical to strategic)
- Backup plan:
  - Demo 1 (ACA deploy) fails: show pre-recorded, emphasize "even when it works, you need escape hatch"
  - Demo 2 (ACA→K8s) fails: show pre-generated K8s manifests, walk through side-by-side
  - Demo 3 (K8s→ACA) fails: show pre-generated, emphasize bidirectional concept over live execution
  - Internet down: all demos run locally (ACA via cached CLI, Copilot offline, local K8s with minikube)
  - Time short: compress section 3 (migration scenario) to 4 min, keep both AI demos
  - Time over: cut Q&A to 4 min, offer to share contact for follow-up
- Follow-up materials:
  - GitHub repo: bidirectional examples (ACA → K8s → ACA), both directions shown
  - Decision matrix: when to adopt ACA, when to escape, how to maintain both
  - AI prompt templates: ACA→K8s recovery + K8s→ACA generation
  - Slide deck PDF with speaker notes
  - LinkedIn post: "How to use ACA without lock-in" with repo link

## Checklist
- [x] Hook relevant for technical audience (validates ACA users, acknowledges legitimate adoption, poses "what if" scenario)
- [x] 2–4 bullets per section max (each section 3-4 key points, journey-focused: adopt → escape → safety)
- [x] At least one visible proof or demo (3 live demos: ACA deploy celebration, ACA→K8s escape, K8s→ACA round-trip)
- [x] Clear CTA within 2 weeks (if on ACA: generate K8s backup; if new: K8s first; both: test bidirectional)
