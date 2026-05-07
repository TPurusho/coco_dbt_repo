# Post-Task Validation Checklist

After completing any dbt task, validate the output against the applicable layer checks below.

✓ = required  
✗ = not applicable

| Validation Check | Source | Staging | Integration | Presentation | Publish | Snapshot |
|---|---|---|---|---|---|---|
| Correct file naming convention | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| SQL file exists | ✗ | ✓ | ✓ | ✓ | ✓ | ✓ |
| YAML definition exists | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Correct yaml file used | ✓ | ✓ | ✓ | ✓ | ✗ | ✓ |
| sources.yml updated | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ |
| staging.yml updated | ✗ | ✓ | ✗ | ✗ | ✗ | ✗ |
| integration.yml updated | ✗ | ✗ | ✓ | ✗ | ✗ | ✗ |
| presentation.yml updated | ✗ | ✗ | ✗ | ✓ | ✓ | ✗ |
| snapshots.yml updated | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ |
| Model materialization defined | ✗ | ✓ | ✓ | ✓ | ✓ | ✗ |
| Materialization = view | ✗ | ✓ | ✗ | ✗ | ✓ | ✗ |
| Materialization = table | ✗ | ✗ | ✓ | ✗ | ✗ | ✗ |
| Materialization = incremental | ✗ | ✗ | ✗ | ✓ | ✗ | ✗ |
| Source referenced using source() | ✗ | ✓ | ✗ | ✗ | ✗ | ✗ |
| Source NOT referenced directly | ✗ | ✗ | ✓ | ✓ | ✓ | ✓ |
| Models referenced using ref() | ✗ | ✗ | ✓ | ✓ | ✓ | ✓ |
| Source used inside a CTE | ✗ | ✓ | ✗ | ✗ | ✗ | ✗ |
| CTE name follows naming convention | ✗ | ✓ | ✓ | ✓ | ✓ | ✗ |
| Final CTE exists (final) | ✗ | ✗ | ✓ | ✓ | ✓ | ✗ |
| All columns explicitly listed in final CTE | ✗ | ✓ | ✓ | ✓ | ✓ | ✗ |
| Final query uses select * from final | ✗ | ✓ | ✓ | ✓ | ✓ | ✗ |
| Model logic is modular | ✗ | ✓ | ✓ | ✓ | ✓ | ✗ |
| Incremental unique_key defined | ✗ | ✗ | ✗ | ✓ | ✗ | ✗ |
| Metadata columns added where applicable | ✗ | ✗ | ✗ | ✓ | ✗ | ✗ |
| Table description present in YAML | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Column descriptions present | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Column data types defined | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Generic tests present | ✗ | ✓ | ✗ | ✓ | ✓ | ✓ |
| Unique test present | ✗ | ✓ | ✗ | ✓ | ✓ | ✓ |
| Not null test present | ✗ | ✓ | ✗ | ✓ | ✓ | ✓ |
| Composite key handled using dbt_utils | ✗ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Table column validation test present | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ |
| Snapshot strategy defined | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ |
| Snapshot unique_key defined | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ |
| Snapshot check_cols defined | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ |

---

# Validation Notes

## Source Layer

Validate:

- source definitions exist in `sources.yml`
- source names follow naming conventions
- descriptions and data types are present

---

## Staging Layer

Validate:

- materialization is `view`
- source is referenced using `source()`
- staging logic is minimal
- tests exist in `staging.yml`

---

## Integration Layer

Validate:

- materialization is `table`
- staging models are referenced using `ref()`
- reusable business logic is applied
- final CTE pattern is followed

---

## Presentation Layer

Validate:

- materialization is `incremental`
- incremental logic is implemented correctly
- fact and dimension naming conventions are followed
- business-ready structure is maintained

---

## Publish Layer

Validate:

- materialization is `view`
- presentation models are referenced using `ref()`
- logic is lightweight and reporting-focused

---

## Snapshot Layer

Validate:

- snapshot strategy exists
- unique_key exists
- check_cols exists
- snapshot definitions are maintained in `snapshots.yml`