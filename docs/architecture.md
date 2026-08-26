# Architecture

```text
lib/sli_common.dart           stable public barrel
lib/src/foundation/           semantic tokens and themes
lib/src/components/           stable Sli* component contracts
lib/src/shadcn/               isolated Shadcn integration
lib/*.dart                    legacy compatibility surface
```

Applications import `package:sli_common/sli_common.dart`. They do not import `src/`.
Shadcn is an internal engine behind stable wrappers, not the toolkit's public contract.

Legacy files stay available during incremental migration. A legacy component can be
removed only in a new major version after a documented deprecation period.
