# Talk Identity
Purpose: define the context, constraints, and target audience.

## How to fill
- Use measurable and specific values.
- Indicate one primary audience.
- Choose one talk type (spoken, hands-on, mixed, panel).

## Template
- Title: Portable PaaS Deployments with Azure Container Apps: YAML Patterns for Cloud-to-Edge Portability
- Subtitle (optional): From Azure-native to anywhere with deployment overlays and AI-assisted transformations
- Duration (minutes): 45 (including Q&A, ~38 min content + 7 min buffer)
- Event / context: SLA & API Conference 2025 - Berlin
- Objective (1 measurable outcome): Attendees will understand how to use Azure Container Apps safely by maintaining standard Kubernetes manifests as source of truth, enabling bidirectional AI-assisted transformation (ACA ⇄ K8s) for portability without lock-in
- Primary audience (role, seniority): Cloud architects, platform engineers, DevOps engineers (mid to senior level)
- Prerequisites / assumed knowledge: Basic container concepts, familiarity with YAML, awareness of Kubernetes basics (not expert-level), some exposure to Azure or cloud platforms
- Talk type (spoken / hands-on / demo / mixed / panel): Mixed (spoken with live demos and YAML walkthroughs)
- Constraints (room, tech, timing, etc.): Need stable internet for Azure demos, screen suitable for code display, ability to switch between slides and terminal/editor, potential audience mix (developers to architects)
- Expected post-talk action: Attendees already using ACA will generate standard K8s manifests as backup using AI; new projects will maintain K8s manifests as source of truth even if deploying only to ACA; all test bidirectional transformation on one service within 2 weeks

## Checklist
- [x] Objective is measurable (understand safe ACA usage + implement bidirectional K8s transformation)
- [x] Audience is specific (cloud architects, platform/DevOps engineers, mid-senior, likely already using or evaluating ACA)
- [x] Format matches the goal (mixed: theory + demos showing ACA adoption journey with escape hatch)
- [x] Constraints identified (internet, code display, audience breadth, many may already be on ACA)
