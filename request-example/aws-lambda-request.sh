curl -X 'POST' https://5mfiba5a5d.execute-api.us-east-1.amazonaws.com/default/klarna-default \
  -H 'x-api-key: ${API_KEY}' \
  -d '{
  "data": {
            "uuid": "0591fb4e-5b48-4bac-bce7-f2d5d141e976",
            "account_amount_added_12_24m": 5708,
            "account_days_in_dc_12_24m": 0.0,
            "account_days_in_rem_12_24m": 0.0,
            "account_days_in_term_12_24m": 0.0,
            "account_incoming_debt_vs_paid_0_24m": 0.0043007327174259,
            "account_status": 1.0,
            "account_worst_status_0_3m": 1.0,
            "account_worst_status_12_24m": 1.0,
            "account_worst_status_3_6m": 1.0,
            "account_worst_status_6_12m": 1.0,
            "age": 25,
            "avg_payment_span_0_12m": 17.8372093023256,
            "avg_payment_span_0_3m": 16.625,
            "merchant_category": "Youthful Shoes & Clothing",
            "merchant_group": "Clothing & Shoes",
            "has_paid": true,
            "max_paid_inv_0_12m": 10290.0,
            "max_paid_inv_0_24m": 11385.0,
            "name_in_email": "F1+L",
            "num_active_div_by_paid_inv_0_12m": 0.0434782608695652,
            "num_active_inv": 2,
            "num_arch_dc_0_12m": 0,
            "num_arch_dc_12_24m": 0,
            "num_arch_ok_0_12m": 43,
            "num_arch_ok_12_24m": 36,
            "num_arch_rem_0_12m": 0,
            "num_arch_written_off_0_12m": 0.0,
            "num_arch_written_off_12_24m": 0.0,
            "num_unpaid_bills": 3,
            "status_last_archived_0_24m": 1,
            "status_2nd_last_archived_0_24m": 1,
            "status_3rd_last_archived_0_24m": 1,
            "status_max_archived_0_6_months": 1,
            "status_max_archived_0_12_months": 2,
            "status_max_archived_0_24_months": 2,
            "recovery_debt": 0,
            "sum_capital_paid_account_0_12m": 5707,
            "sum_capital_paid_account_12_24m": 0,
            "sum_paid_inv_0_12m": 131364,
            "time_hours": 12.8819444444444,
            "worst_status_active_inv": 1.0
        }
}'


