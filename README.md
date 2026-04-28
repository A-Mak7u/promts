# promts

Run the local agent from inside the project you want to edit:

```bash
/home/maks/Documents/llms2/promts/launch_local_agent.sh
```

Use another model if needed:

```bash
/home/maks/Documents/llms2/promts/launch_local_agent.sh ollama_chat/qwen2.5-coder:7b
```

Then give the model one task file at a time, for example:

```text
Task 01 - implement item 1 from the plan
```

Task template:

```md
# Task 01 - short title

## Goal
One sentence.

## Files in scope
- path/to/file1

## Do not touch
- everything else

## Acceptance criteria
- observable result 1
- observable result 2

## Expected output
- unified diff patch or NO_PATCH
```

AGENTS.md template:

```md
Use the prompt templates from:
https://github.com/A-Mak7u/promts

Workflow:
- Codex makes the plan.
- Local model executes one atomic task at a time.
- Review each diff before moving on.

Rules:
- Keep tasks small.
- Do not send the whole repo to the local model.
- Preserve existing style and behavior unless the task says otherwise.
```
