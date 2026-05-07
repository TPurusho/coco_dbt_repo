# Surrogate Key Pattern

This pattern defines how surrogate keys should be generated using dbt_utils.

---

# Macro

Use the dbt_utils macro:

dbt_utils.generate_surrogate_key()

---

# Syntax

{{ dbt_utils.generate_surrogate_key([

    'column_1',
    'column_2',
    'column_3'

]) }}

---

# Example

select

    {{ dbt_utils.generate_surrogate_key([

        'property_id',
        'fund_id'

    ]) }} as property_fund_sk,

    property_id,
    fund_id,
    property_name,
    market_value,
    load_date

from {{ ref('int_property_loans') }}

---

# Example for Dimension Model

select

    {{ dbt_utils.generate_surrogate_key([

        'property_id'

    ]) }} as property_sk,

    property_id,
    property_name,
    property_type,
    state,
    company

from {{ ref('int_property_loans') }}

---

# Rules

1. Surrogate keys should only be generated in:

- integration models
- presentation models

---

2. Do NOT generate surrogate keys in:

- source definitions
- staging models
- publish models

---

3. Always name surrogate keys using:

<entity>_sk

Examples:

- property_sk
- fund_sk
- loan_sk
- property_fund_sk

---

4. The macro automatically hashes the values to create a deterministic key.

---

# Recommended Usage

Use surrogate keys for:

- dimension tables
- fact tables
- composite business keys
- slowly changing dimensions

---

# Composite Key Example

{{ dbt_utils.generate_surrogate_key([

    'property_id',
    'month_end_date'

]) }} as property_position_sk

---

# Dependency

Ensure dbt_utils package is installed.

packages.yml

packages:
  - package: dbt-labs/dbt_utils
    version: ">=1.0.0"

---

# Best Practices

- use stable business columns for key generation
- avoid timestamps in surrogate key generation
- keep surrogate key naming consistent
- generate surrogate keys only in reusable transformation layers
- use lowercase naming conventions