# Bugfix prompt

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

