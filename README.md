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

Other templates:

- `bugfix.md`
- `refactor.md`
- `docs_only.md`
- `agent_smoke.md`

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

New project prompt:

```text
Inspect this repository as a senior engineer.

Produce:
- a short project map
- the build/test command
- entrypoints
- conventions
- risks
- a small task plan split into atomic tasks

Then create one task file per atomic task.
Use the local-model workflow from https://github.com/A-Mak7u/promts.
```

Bugfix prompt:

```text
Fix this bug with the smallest safe change.

Before editing:
- identify the exact failing behavior
- find the smallest file scope
- state the regression risk

Constraints:
- do not refactor unrelated code
- do not broaden scope
- preserve existing behavior outside the bug

Output:
- one small patch
- or NO_PATCH if the fix is unsafe without more context
```

Refactor prompt:

```text
Refactor only what is necessary to improve clarity or maintainability.

Constraints:
- keep behavior unchanged
- keep file scope narrow
- prefer mechanical changes over redesign

Output:
- unified diff patch only
- or NO_PATCH if behavior cannot be preserved confidently
```

Docs-only prompt:

```text
Update documentation only.

Constraints:
- do not modify runtime code unless absolutely required
- keep the wording concise
- preserve existing structure and terminology

Output:
- unified diff patch only
- or NO_PATCH if the docs change needs code changes first
```

Agent smoke prompt:

```text
Perform a minimal smoke test for the local agent workflow.

Goal:
- create or modify one file
- confirm the file exists after the change

Constraints:
- touch as little as possible
- report any missing capability clearly

Output:
- a short summary
- exact file path
- pass/fail result
```

Old project prompt:

```text
Inspect this existing repository carefully.

Focus on:
- current git status
- repo layout
- tests
- entrypoints
- local conventions
- hidden risks from old code

Do not refactor broadly.
Split work into small tasks only.
Use the local-model workflow from https://github.com/A-Mak7u/promts.
```
