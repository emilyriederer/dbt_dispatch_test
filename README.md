## Dispatch Tests

This project serves as a reprex to ask a question about [adapter dispatch](https://docs.getdbt.com/reference/dbt-jinja-functions/dispatch) with complex argument. This issue was encountered when debugging [PR#10](https://github.com/emilyriederer/dbtplyr/pull/10#issuecomment-1113856927) to the `dbtplyr` package. 

### Key Issue

How can we pass complex object through layers of dispatch? This seems to work for lists but not refs. 

**Test 1:** Compare dispatch and non-dispatch for lists. Found that both work the same.

- `macros/across.sql` defines `across1()` (using dispatch) and `across2()` (without dispatch)
- Models `list_dispatch.sql` and `list_nodispatch.sql` call `across1()` and `across2()` respectively
- These models compile to the same SQL (as desired) in the `targets/` subdirectory

**Test 2:** Compare dispatch and non-dispatch for refs. Find that dispatch breaks. 

- `macros/all_cols.sql` defines `all_cols1()` (using dispatch) and `all_cols2()` (without dispatch)
- (Note that the above is a silly macro that has no value over `select *`. For debugging purposes only.)
- Models `ref_dispatch.sql` and `ref_nodispatch.sql` call `all_cols1()` and `all_cols2()` respectively
- Model `ref_dispatch.sql` does not compile to desired SQL, whereas `ref_nodispatch.sql` does

### Steps to Reproduce

After pulling this repository into a development environment:

1. Point the `dbt_profile.yml` to a relevant profile
1. Move into folder
1. Run `dbt run`
1. Inspect compiled SQL in `targets/` directory. For convenience, the relevant subdirectory has been unignored.