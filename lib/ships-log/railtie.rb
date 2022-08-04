class ShipsLog < Rails::Railtie
  initializer "ships_log_initialization" do
     HEALTH_CATEGORIES = [
      "Standard",
      "Standard Plus",
      "Preferred",
      "Preferred Plus"
    ]

    # These are broken out for the UI, but don't match how we structure them
    # in Reagan. It's also how we display them in Poseidon/Dashboard
    GUARANTEED_UNIVERSAL_LIFE_PRODUCTS = [
      "To age 121 (No Lapse U/L)",
      "To age 121 (Pay to 65)",
      "To age 121 (Pay to 100)",
      "To age 121 (20 Pay)",
      "To age 121 (10 Pay)",
      "To age 121 (Single Pay)",
      "To age 65",
      "To age 70",
      "To age 75",
      "To age 80",
      "To age 85",
      "To age 90",
      "To age 95",
      "To age 100",
      "To age 105",
      "To age 110"
    ]

    TERM_LIFE_INSURANCE_PRODUCTS = [
      "1 Year Term",
      "5 Year Term",
      "10 Year Term",
      "15 Year Term",
      "20 Year Term",
      "25 Year Term",
      "30 Year Term",
      "35 Year Term",
      "40 Year Term"
    ]

    OTHER_PRODUCTS = [
      "Whole Life",
      "Final Expense"
    ]

    ROP_PRODUCTS = [
      "15 Year Term ROP",
      "20 Year Term ROP",
      "25 Year Term ROP",
      "30 Year Term ROP",
      "To age 65 (ROP)",
      "To age 70 (ROP)",
      "To age 75 (ROP)"
    ]

    # This is how we structure product/product_type_detail in the hornet/reagan,
    # NOT the customer UIs
    PRODUCT_TYPE_DETAILS_BY_PRODUCT_TYPE = {
      "Term" => [
        "1 Year Term",
        "5 Year Term",
        "10 Year Term",
        "11 Year Term",
        "12 Year Term",
        "13 Year Term",
        "14 Year Term",
        "15 Year Term",
        "16 Year Term",
        "17 Year Term",
        "18 Year Term",
        "19 Year Term",
        "20 Year Term",
        "21 Year Term",
        "22 Year Term",
        "23 Year Term",
        "24 Year Term",
        "25 Year Term",
        "26 Year Term",
        "27 Year Term",
        "28 Year Term",
        "29 Year Term",
        "30 Year Term",
        "31 Year Term",
        "32 Year Term",
        "33 Year Term",
        "34 Year Term",
        "35 Year Term",
        "40 Year Term"
      ],
      "Term ROP" => [
        "1 Year Term ROP",
        "5 Year Term ROP",
        "10 Year Term ROP",
        "12 Year Term ROP",
        "15 Year Term ROP",
        "16 Year Term ROP",
        "17 Year Term ROP",
        "18 Year Term ROP",
        "19 Year Term ROP",
        "20 Year Term ROP",
        "21 Year Term ROP",
        "22 Year Term ROP",
        "23 Year Term ROP",
        "24 Year Term ROP",
        "25 Year Term ROP",
        "26 Year Term ROP",
        "27 Year Term ROP",
        "28 Year Term ROP",
        "29 Year Term ROP",
        "30 Year Term ROP",
        "31 Year Term ROP",
        "32 Year Term ROP",
        "33 Year Term ROP",
        "34 Year Term ROP",
        "35 Year Term ROP",
        "40 Year Term ROP"
      ],
      "UL" => [
        "To age 65",
        "To age 65 (ROP)",
        "To age 70",
        "To age 70 (ROP)",
        "To age 75",
        "To age 75 (ROP)",
        "To age 80",
        "To age 85",
        "To age 90",
        "To age 95",
        "To age 100",
        "To age 105",
        "To age 110",
        "To age 121 (No Lapse U/L)",
        "To age 121 (Pay to 65)",
        "To age 121 (Pay to 100)",
        "To age 121 (20 Pay)",
        "To age 121 (10 Pay)",
        "To age 121 (Single Pay)"
      ],
      "Whole Life" => ["Whole Life"],
      "Final Expense" => ["Final Expense"],
      "Long Term Care" => ["Long Term Care"]
    }

    ROLES = ["member", "sales_rep", "admin"]

    ANNUITY_PRODUCT_TYPES = ["Fixed Indexed","Multi-Year Guarantee (MYGA)","Single Premium Immediate (SPIA)","Traditional Fixed"]
    DISABILITY_PRODUCT_TYPES = ["Short Term","Long Term","Group","Supplemental Income"]
    LONG_TERM_CARE_PRODUCT_TYPES = ["Other"]
    LIFE_PRODUCT_TYPES = ["Term","Term ROP","UL","Whole Life","Final Expense"]
    LINES_OF_COVERAGE = ["Annuity","Life","Disability","Long Term Care"]

    IXN_HEALTH_CATEGORIES = ["Preferred Plus","Preferred","Standard Plus","Standard"]
    ALL_HEALTH_CATEGORIES = (IXN_HEALTH_CATEGORIES + ("A".."P").map { |letter| "Table #{letter}" }).freeze

    STATE_DETAILS = {
      "AL"=> {
        :label => "Alabama",
        :insureio_id => 1
      },
      "AK"=> {
        :label => "Alaska",
        :insureio_id => 2
      },
      "AS"=> {
        :label => "American Samoa",
        :insureio_id => 56
      },
      "AZ"=> {
        :label => "Arizona",
        :insureio_id => 3
      },
      "AR"=> {
        :label => "Arkansas",
        :insureio_id => 4
      },
      "CA"=> {
        :label => "California",
        :insureio_id => 5
      },
      "CO"=> {
        :label => "Colorado",
        :insureio_id => 6
      },
      "CT"=> {
        :label => "Connecticut",
        :insureio_id => 7
      },
      "DE"=> {
        :label => "Delaware",
        :insureio_id => 8
      },
      "DC"=> {
        :label => "District of Columbia",
        :insureio_id => 9
      },
      "FM"=> {
        :label => "Federated States of Micronesia",
        :insureio_id => nil
      },
      "FL"=> {
        :label => "Florida",
        :insureio_id => 10
      },
      "GA"=> {
        :label => "Georgia",
        :insureio_id => 11
      },
      "GU"=> {
        :label => "Guam",
        :insureio_id => 53
      },
      "HI"=> {
        :label => "Hawaii",
        :insureio_id => 12
      },
      "ID"=> {
        :label => "Idaho",
        :insureio_id => 13
      },
      "IL"=> {
        :label => "Illinois",
        :insureio_id => 14
      },
      "IN"=> {
        :label => "Indiana",
        :insureio_id => 15
      },
      "IA"=> {
        :label => "Iowa",
        :insureio_id => 16
      },
      "KS"=> {
        :label => "Kansas",
        :insureio_id => 17
      },
      "KY"=> {
        :label => "Kentucky",
        :insureio_id => 18
      },
      "LA"=> {
        :label => "Louisiana",
        :insureio_id => 19
      },
      "ME"=> {
        :label => "Maine",
        :insureio_id => 20
      },
      "MH"=> {
        :label => "Marshal Islands",
        :insureio_id => nil
      },
      "MD"=> {
        :label => "Maryland",
        :insureio_id => 21
      },
      "MA"=> {
        :label => "Massachusetts",
        :insureio_id => 22
      },
      "MI"=> {
        :label => "Michigan",
        :insureio_id => 23
      },
      "MN"=> {
        :label => "Minnesota",
        :insureio_id => 24
      },
      "MS"=> {
        :label => "Mississippi",
        :insureio_id => 25
      },
      "MO"=> {
        :label => "Missouri",
        :insureio_id => 26
      },
      "MT"=> {
        :label => "Montana",
        :insureio_id => 27
      },
      "NE"=> {
        :label => "Nebraska",
        :insureio_id => 28
      },
      "NV"=> {
        :label => "Nevada",
        :insureio_id => 29
      },
      "NH"=> {
        :label => "New Hampshire",
        :insureio_id => 30
      },
      "NJ"=> {
        :label => "New Jersey",
        :insureio_id => 31
      },
      "NM"=> {
        :label => "New Mexico",
        :insureio_id => 32
      },
      "NY"=> {
        :label => "New York",
        :insureio_id => 33
      },
      "NC"=> {
        :label => "North Carolina",
        :insureio_id => 35
      },
      "ND"=> {
        :label => "North Dakota",
        :insureio_id => 36
      },
      "MP"=> {
        :label => "Northern Mariana Islands",
        :insureio_id => nil
      },
      "OH"=> {
        :label => "Ohio",
        :insureio_id => 37
      },
      "OK"=> {
        :label => "Oklahoma",
        :insureio_id => 38
      },
      "OR"=> {
        :label => "Oregon",
        :insureio_id => 39
      },
      "PW"=> {
        :label => "Palau",
        :insureio_id => nil
      },
      "PA"=> {
        :label => "Pennsylvania",
        :insureio_id => 40
      },
      "PR"=> {
        :label => "Puerto Rico",
        :insureio_id => 54
      },
      "RI"=> {
        :label => "Rhode Island",
        :insureio_id => 41
      },
      "SC"=> {
        :label => "South Carolina",
        :insureio_id => 42
      },
      "SD"=> {
        :label => "South Dakota",
        :insureio_id => 43
      },
      "TN"=> {
        :label => "Tennessee",
        :insureio_id => 44
      },
      "TX"=> {
        :label => "Texas",
        :insureio_id => 45
      },
      "UT"=> {
        :label => "Utah",
        :insureio_id => 46
      },
      "VT"=> {
        :label => "Vermont",
        :insureio_id => 47
      },
      "VI"=> {
        :label => "Virgin Islands",
        :insureio_id => 55
      },
      "VA"=> {
        :label => "Virginia",
        :insureio_id => 48
      },
      "WA"=> {
        :label => "Washington",
        :insureio_id => 49
      },
      "WV"=> {
        :label => "West Virginia",
        :insureio_id => 50
      },
      "WI"=> {
        :label => "Wisconsin",
        :insureio_id => 51
      },
      "WY"=> {
        :label => "Wyoming",
        :insureio_id => 52
      },
    }

    STATES = {}
    STATE_SELECT_OPTIONS = []

    STATE_DETAILS.each do |abbr, details|
      STATES[abbr] = details[:label]
      STATE_SELECT_OPTIONS << [details[:label], abbr]
    end

    QUOTE_ACTIONS = [
      {
        :value => "default",
        :label => "Webhook GET",
        :group => "Basic",
        :products => ["WebsiteQuoter", "BgaQuoter", "MobileApp"]
      },
      {
        :value => "webhook_post",
        :label => "Webhook POST",
        :group => "Basic",
        :products => ["BgaQuoter"]
      },
      {
        :value => "simple_url",
        :label => "Simple URL (No Data Payload)",
        :group => "Basic",
        :products => ["BgaQuoter"]
      },
      {
        :value => "applicant",
        :label => "ApplicInt",
        :group => "E-Ticket",
        :products => ["BgaQuoter", "MobileApp"]
      },
      {
        :value => "protective",
        :label => "Protective",
        :group => "E-Ticket",
        :products => ["BgaQuoter", "MobileApp"]
      },
      {
        :value => "paclife",
        :label => "Pacific Life",
        :group => "E-Ticket",
        :products => ["BgaQuoter", "MobileApp"]
      },
      {
        :value => "sbli",
        :label => "SBLI",
        :group => "E-Ticket",
        :products => ["BgaQuoter", "MobileApp"]
      },
      {
        :value => "anico",
        :label => "American National",
        :group => "E-Ticket",
        :products => ["BgaQuoter", "MobileApp"]
      },
      {
        :value => "firelight",
        :label => "Firelight",
        :group => "Integrations",
        :products => ["BgaQuoter"]
      },
      {
        :value => "psg_eapp",
        :label => "PSG E-Application",
        :group => "E-App",
        :products => ["BgaQuoter", "MobileApp"]
      },
      {
        :value => "typeform",
        :label => "TypeForm",
        :group => "Form",
        :products => ["WebsiteQuoter", "BgaQuoter", "MobileApp"]
      },
      {
        :value => "formassembly",
        :label => "FormAssembly",
        :group => "Form",
        :products => ["WebsiteQuoter", "BgaQuoter", "MobileApp"]
      },
      {
        :value => "123_contact_form",
        :label => "123 Contact Form",
        :group => "Form",
        :products => ["WebsiteQuoter", "BgaQuoter", "MobileApp"]
      },
      {
        :value => "cognito_form",
        :label => "Cognito Form",
        :group => "Form",
        :products => ["WebsiteQuoter", "BgaQuoter", "MobileApp"]
      },
      {
        :value => "formsite",
        :label => "Formsite",
        :group => "Form",
        :products => ["WebsiteQuoter", "BgaQuoter", "MobileApp"]
      },
      {
        :value => "jotform",
        :label => "Jotform",
        :group => "Form",
        :products => ["WebsiteQuoter", "BgaQuoter", "MobileApp"]
      },
      {
        :value => "formstack",
        :label => "FormStack",
        :group => "Form",
        :products => ["WebsiteQuoter", "BgaQuoter", "MobileApp"]
      },
      {
        :value => "wufoo",
        :label => "Wufoo",
        :group => "Form",
        :products => ["WebsiteQuoter", "BgaQuoter", "MobileApp"]
      },
      {
        :value => "google_form",
        :label => "Google Form",
        :group => "Form",
        :products => ["WebsiteQuoter", "BgaQuoter", "MobileApp"]
      },
      {
        :value => "ixn_lead_form",
        :label => "IXN Lead Form",
        :group => "CRM",
        :products => ["WebsiteQuoter"]
      },
      {
        :value => "insureio",
        :label => "Insure.io",
        :group => "CRM",
        :products => ["WebsiteQuoter"]
      },
      {
        :value => "send_quote_as_email",
        :label => "Email PDF",
        :group => "Default",
        :products => ["BgaQuoter", "MobileApp"]
      },
      {
        :value => "send_quote_as_text",
        :label => "Text PDF",
        :group => "Default",
        :products => ["BgaQuoter", "MobileApp"]
      },
      {
        :value => "download_quotes_pdf",
        :label => "Download PDF",
        :group => "Default",
        :products => ["BgaQuoter"]
      },
      {
        :value => "request_forms",
        :label => "Request Forms",
        :group => "Default",
        :products => ["BgaQuoter"]
      },
      {
        :value => "standard_packet",
        :label => "Standard Packet",
        :group => "Default",
        :products => ["BgaQuoter"]
      },
      {
        :value => "nmb_term_eticket",
        :label => "National Mutual Benefit Term E-Ticket",
        :group => "E-Ticket",
        :products => ["BgaQuoter"]
      },
      {
        :value => "nmb_whole_life_eticket",
        :label => "National Mutual Benefit Whole Life E-Ticket",
        :group => "E-Ticket",
        :products => ["BgaQuoter"]
      },
      {
        :value => "ethos",
        :label => "Ethos",
        :group => "Instant Issue",
        :products => ["BgaQuoter", "MobileApp"]
      }
    ]

    INSUREIO_HEALTH_CATEGORIES = {
      "Preferred Plus" => {
        :id => 1
      },
      "Preferred" => {
        :id => 2
      },
      "Standard Plus" => {
        :id => 3
      },
      "Standard" => {
        :id => 4
      },
      "Preferred Tobacco" => {
        :id => 5
      },
      "Standard Tobacco" => {
        :id => 6
      }
    }

    INSUREIO_PRODUCT_TYPES = {
      "Term" => {
        :id => 1
      },
      "Term ROP" => {
        :id => 1
      },
      "UL" => {
        :id => 2
      },
      "Whole Life" => {
        :id => 3
      },
      "Final Expense" => {
        :id => 1
      }
    }

    INSUREIO_PRODUCT_CATEGORIES = {
      "10 Year Term" => {
        :id => 1,
        :name => "10 years"
      },
      "15 Year Term" => {
        :id => 2,
        :name => "15 years"
      },
      "20 Year Term" => {
        :id => 3,
        :name => "20 years"
      },
      "25 Year Term" => {
        :id => 4,
        :name => "25 years"
      },
      "30 Year Term" => {
        :id => 5,
        :name => "30 years"
      },
      "40 Year Term" => {
        :id => 6,
        :name => "40 years"
      },
      "To age 65" => {
        :id => 7,
        :name => "To Age 65"
      },
      "To age 70" => {
        :id => 8,
        :name => "To Age 70"
      },
      "To age 75" => {
        :id => 9,
        :name => "To Age 75"
      },
      "To age 90" => {
        :id => 10,
        :name => "To Age 90"
      },
      "To age 95" => {
        :id => 11,
        :name => "To Age 95"
      },
      "To age 100" => {
        :id => 12,
        :name => "To Age 100"
      },
      "To age 105" => {
        :id => 13,
        :name => "To Age 105"
      },
      "To age 110" => {
        :id => 14,
        :name => "To Age 110"
      },
      "To age 121 (No Lapse U/L)" => {
        :id => 15,
        :name => "To Age 121 (No Lapse U/L)"
      },
      "To age 121 (Pay to 100)" => {
        :id => 16,
        :name => "To Age 121 - Pay to 100"
      },
      "15 Year Term ROP" => {
        :id => 17,
        :name => "15-Year Return of Premium"
      },
      "20 Year Term ROP" => {
        :id => 18,
        :name => "20-Year Return of Premium"
      },
      "25 Year Term ROP" => {
        :id => 19,
        :name => "25-Year Return of Premium"
      },
      "30 Year Term ROP" => {
        :id => 20,
        :name => "30-Year Return of Premium"
      }
    }

    PROTECTIVE_ETICKET_SUPPORTED_PRODUCTS = [
      39,   # Custom Choice UL 10
      40,   # Custom Choice UL 15
      1412, # Custom Choice UL 20
      42,   # Custom Choice UL 25
      43,   # Custom Choice UL 30

      2161, # Classic Choice Term 10
      2162, # Classic Choice Term 15
      2163, # Classic Choice Term 20
      2164, # Classic Choice Term 25
      2165, # Classic Choice Term 30
      2446, # Classic Choice Term 35
      2447  # Classic Choice Term 40
    ]

    AGENT_INFORMATION_FIELDS = [
      "email",
      "first_name",
      "insurance_license_number",
      "last_name",
      "middle_name",
      "phone"
    ]

    SMS_PHONE_NUMBER = "+18012141509"

    DEFAULT_FORMULAS = {
      "Life" => {
        "base_premium" => "round((AGE_RATE * FACE_AMOUNT_IN_THOUSANDS * MODAL_FACTOR), 2)",
        "policy_fee" => "round((POLICY_FEE * MODAL_FACTOR), 2)",
        "table_rate_fee" => "round((BASE_PREMIUM * TABLE_RATE_PERCENT), 2)",
        "adb_rider_fee" => "round(((MAX_BENEFIT_COVERAGE / 1000) * RIDER_RATE) * MODAL_FACTOR, 2)",
        "wop_rider_fee" => "round((RIDER_RATE * FACE_AMOUNT_IN_THOUSANDS * MODAL_FACTOR), 2)",
        "child_rider_fee" => "round((RIDER_RATE * CHILD_RIDER_UNITS * MODAL_FACTOR), 2)",
        "child_wop_rider_fee" => "round((RIDER_RATE * CHILD_RIDER_UNITS * MODAL_FACTOR), 2)",
        "flat_extra_fee" => "round((FLAT_EXTRA_TOTAL * MODAL_FACTOR), 2)",
        "total" => "round((BASE_PREMIUM + POLICY_FEE + TABLE_RATE_FEE + FLAT_EXTRA_FEE + ADB_RIDER_FEE + WOP_RIDER_FEE + CHILD_RIDER_FEE + CHILD_WOP_RIDER_FEE), 2)"
      }
    }
    # these keys should match the LIFE_PRODUCT_TYPES values
    FORMULA_TYPE_DETAILS_BY_PRODUCT_TYPE = {
      "Term" => {
        "base_premium" => {
          "label" => "Base Premium",
          "variables" => [
            "AGE_RATE",
            "FACE_AMOUNT_IN_THOUSANDS",
            "MODAL_FACTOR"
          ]
        },
        "policy_fee" => {
          "label" => "Policy Fee",
          "variables" => [
            "MODAL_FACTOR",
            "POLICY_FEE"
          ]
        },
        "table_rate_fee" => {
          "label" => "Table Rate Fee",
          "variables" => [
            "AGE_RATE",
            "BASE_PREMIUM",
            "FACE_AMOUNT_IN_THOUSANDS",
            "MODAL_FACTOR",
            "TABLE_RATE_PERCENT"
          ]
        },
        "adb_rider_fee" => {
          "label" => "ADB Rider Fee",
          "variables" => [
            "MAX_BENEFIT_COVERAGE",
            "MODAL_FACTOR",
            "RIDER_RATE"
          ]
        },
        "wop_rider_fee" => {
          "label" => "WOP Rider Fee",
          "variables" => [
            "ADB_RIDER_FEE",
            "BASE_PREMIUM",
            "CHILD_RIDER_FEE",
            "FACE_AMOUNT_IN_THOUSANDS",
            "FLAT_EXTRA_FEE",
            "MODAL_FACTOR",
            "POLICY_FEE",
            "RIDER_RATE",
            "TABLE_RATE_FEE"
          ]
        },
        "child_rider_fee" => {
          "label" => "Child Rider Fee",
          "variables" => [
            "CHILD_RIDER_UNITS",
            "COVERAGE_PER_UNIT",
            "MODAL_FACTOR",
            "RIDER_RATE"
          ]
        },
        "child_wop_rider_fee" => {
          "label" => "Combined Child/WOP Rider Fee",
          "variables" => [
            "CHILD_RIDER_UNITS",
            "MODAL_FACTOR",
            "RIDER_RATE",
            "TABLE_RATE_PERCENT"
          ]
        },
        "flat_extra_fee" => {
          "label" => "Flat Extra Fee",
          "variables" => [
            "FLAT_EXTRA_TOTAL",
            "MODAL_FACTOR"
          ]
        },
        "total" => {
          "label" => "Total",
          "variables" => [
            "ADB_RIDER_FEE",
            "BASE_PREMIUM",
            "CHILD_RIDER_FEE",
            "CHILD_WOP_RIDER_FEE",
            "FLAT_EXTRA_FEE",
            "MODAL_FACTOR",
            "POLICY_FEE",
            "TABLE_RATE_FEE",
            "WOP_RIDER_FEE"
          ]
        }
      },
      "UL" => {
        "base_premium" => {
          "label" => "Base Premium",
          "variables" => [
            "AGE_RATE",
            "FACE_AMOUNT_IN_THOUSANDS",
            "MODAL_FACTOR"
          ]
        },
        "policy_fee" => {
          "label" => "Policy Fee",
          "variables" => [
            "MODAL_FACTOR",
            "POLICY_FEE"
          ]
        },
        "table_rate_fee" => {
          "label" => "Table Rate Fee",
          "variables" => [
            "AGE_RATE",
            "BASE_PREMIUM",
            "FACE_AMOUNT_IN_THOUSANDS",
            "MODAL_FACTOR",
            "TABLE_RATE_PERCENT"
          ]
        },
        "adb_rider_fee" => {
          "label" => "ADB Rider Fee",
          "variables" => [
            "MAX_BENEFIT_COVERAGE",
            "MODAL_FACTOR",
            "RIDER_RATE"
          ]
        },
        "wop_rider_fee" => {
          "label" => "WOP Rider Fee",
          "variables" => [
            "ADB_RIDER_FEE",
            "BASE_PREMIUM",
            "CHILD_RIDER_FEE",
            "FACE_AMOUNT_IN_THOUSANDS",
            "FLAT_EXTRA_FEE",
            "MODAL_FACTOR",
            "POLICY_FEE",
            "RIDER_RATE",
            "TABLE_RATE_FEE"
          ]
        },
        "child_rider_fee" => {
          "label" => "Child Rider Fee",
          "variables" => [
            "CHILD_RIDER_UNITS",
            "COVERAGE_PER_UNIT",
            "MODAL_FACTOR",
            "RIDER_RATE"
          ]
        },
        "child_wop_rider_fee" => {
          "label" => "Combined Child/WOP Rider Fee",
          "variables" => [
            "CHILD_RIDER_UNITS",
            "MODAL_FACTOR",
            "RIDER_RATE",
            "TABLE_RATE_PERCENT"
          ]
        },
        "flat_extra_fee" => {
          "label" => "Flat Extra Fee",
          "variables" => [
            "FLAT_EXTRA_TOTAL",
            "MODAL_FACTOR"
          ]
        },
        "total" => {
          "label" => "Total",
          "variables" => [
            "ADB_RIDER_FEE",
            "BASE_PREMIUM",
            "CHILD_RIDER_FEE",
            "CHILD_WOP_RIDER_FEE",
            "FLAT_EXTRA_FEE",
            "MODAL_FACTOR",
            "POLICY_FEE",
            "TABLE_RATE_FEE",
            "WOP_RIDER_FEE"
          ]
        }
      },
      "Final Expense" => {
        "base_premium" => {
          "label" => "Base Premium",
          "variables" => [
            "AGE_RATE",
            "FACE_AMOUNT_IN_THOUSANDS",
            "MODAL_FACTOR"
          ]
        },
        "policy_fee" => {
          "label" => "Policy Fee",
          "variables" => [
            "MODAL_FACTOR",
            "POLICY_FEE"
          ]
        },
        "table_rate_fee" => {
          "label" => "Table Rate Fee",
          "variables" => [
            "AGE_RATE",
            "BASE_PREMIUM",
            "FACE_AMOUNT_IN_THOUSANDS",
            "MODAL_FACTOR",
            "TABLE_RATE_PERCENT"
          ]
        },
        "adb_rider_fee" => {
          "label" => "ADB Rider Fee",
          "variables" => [
            "MAX_BENEFIT_COVERAGE",
            "MODAL_FACTOR",
            "RIDER_RATE"
          ]
        },
        "wop_rider_fee" => {
          "label" => "WOP Rider Fee",
          "variables" => [
            "ADB_RIDER_FEE",
            "BASE_PREMIUM",
            "CHILD_RIDER_FEE",
            "FACE_AMOUNT_IN_THOUSANDS",
            "FLAT_EXTRA_FEE",
            "MODAL_FACTOR",
            "POLICY_FEE",
            "RIDER_RATE",
            "TABLE_RATE_FEE"
          ]
        },
        "child_rider_fee" => {
          "label" => "Child Rider Fee",
          "variables" => [
            "CHILD_RIDER_UNITS",
            "COVERAGE_PER_UNIT",
            "MODAL_FACTOR",
            "RIDER_RATE"
          ]
        },
        "child_wop_rider_fee" => {
          "label" => "Combined Child/WOP Rider Fee",
          "variables" => [
            "CHILD_RIDER_UNITS",
            "MODAL_FACTOR",
            "RIDER_RATE",
            "TABLE_RATE_PERCENT"
          ]
        },
        "flat_extra_fee" => {
          "label" => "Flat Extra Fee",
          "variables" => [
            "FLAT_EXTRA_TOTAL",
            "MODAL_FACTOR"
          ]
        },
        "total" => {
          "label" => "Total",
          "variables" => [
            "ADB_RIDER_FEE",
            "BASE_PREMIUM",
            "CHILD_RIDER_FEE",
            "CHILD_WOP_RIDER_FEE",
            "FLAT_EXTRA_FEE",
            "MODAL_FACTOR",
            "POLICY_FEE",
            "TABLE_RATE_FEE",
            "WOP_RIDER_FEE"
          ]
        }
      },
      "Whole Life" => {
        "base_premium" => {
          "label" => "Base Premium",
          "variables" => [
            "AGE_RATE",
            "FACE_AMOUNT_IN_THOUSANDS",
            "MODAL_FACTOR"
          ]
        },
        "policy_fee" => {
          "label" => "Policy Fee",
          "variables" => [
            "MODAL_FACTOR",
            "POLICY_FEE"
          ]
        },
        "table_rate_fee" => {
          "label" => "Table Rate Fee",
          "variables" => [
            "AGE_RATE",
            "BASE_PREMIUM",
            "FACE_AMOUNT_IN_THOUSANDS",
            "MODAL_FACTOR",
            "TABLE_RATE_PERCENT"
          ]
        },
        "adb_rider_fee" => {
          "label" => "ADB Rider Fee",
          "variables" => [
            "MAX_BENEFIT_COVERAGE",
            "MODAL_FACTOR",
            "RIDER_RATE"
          ]
        },
        "wop_rider_fee" => {
          "label" => "WOP Rider Fee",
          "variables" => [
            "ADB_RIDER_FEE",
            "BASE_PREMIUM",
            "CHILD_RIDER_FEE",
            "FACE_AMOUNT_IN_THOUSANDS",
            "FLAT_EXTRA_FEE",
            "MODAL_FACTOR",
            "POLICY_FEE",
            "RIDER_RATE",
            "TABLE_RATE_FEE"
          ]
        },
        "child_rider_fee" => {
          "label" => "Child Rider Fee",
          "variables" => [
            "CHILD_RIDER_UNITS",
            "COVERAGE_PER_UNIT",
            "MODAL_FACTOR",
            "RIDER_RATE"
          ]
        },
        "child_wop_rider_fee" => {
          "label" => "Combined Child/WOP Rider Fee",
          "variables" => [
            "CHILD_RIDER_UNITS",
            "MODAL_FACTOR",
            "RIDER_RATE",
            "TABLE_RATE_PERCENT"
          ]
        },
        "flat_extra_fee" => {
          "label" => "Flat Extra Fee",
          "variables" => [
            "FLAT_EXTRA_TOTAL",
            "MODAL_FACTOR"
          ]
        },
        "total" => {
          "label" => "Total",
          "variables" => [
            "ADB_RIDER_FEE",
            "BASE_PREMIUM",
            "CHILD_RIDER_FEE",
            "CHILD_WOP_RIDER_FEE",
            "FLAT_EXTRA_FEE",
            "MODAL_FACTOR",
            "POLICY_FEE",
            "TABLE_RATE_FEE",
            "WOP_RIDER_FEE"
          ]
        }
      }
    }

    TIMEZONES = [
      { "label" => "International Date Line West", "value" => "Pacific/Midway" },
      { "label" => "Midway Island", "value" => "Pacific/Midway" },
      { "label" => "American Samoa", "value" => "Pacific/Pago_Pago" },
      { "label" => "Hawaii", "value" => "Pacific/Honolulu" },
      { "label" => "Alaska", "value" => "America/Juneau" },
      { "label" => "Pacific Time (US & Canada)", "value" => "America/Los_Angeles" },
      { "label" => "Tijuana", "value" => "America/Tijuana" },
      { "label" => "Mountain Time (US & Canada)", "value" => "America/Denver" },
      { "label" => "Arizona", "value" => "America/Phoenix" },
      { "label" => "Chihuahua", "value" => "America/Chihuahua" },
      { "label" => "Mazatlan", "value" => "America/Mazatlan" },
      { "label" => "Central Time (US & Canada)", "value" => "America/Chicago" },
      { "label" => "Saskatchewan", "value" => "America/Regina" },
      { "label" => "Guadalajara", "value" => "America/Mexico_City" },
      { "label" => "Mexico City", "value" => "America/Mexico_City" },
      { "label" => "Monterrey", "value" => "America/Monterrey" },
      { "label" => "Central America", "value" => "America/Guatemala" },
      { "label" => "Eastern Time (US & Canada)", "value" => "America/New_York" },
      { "label" => "Indiana (East)", "value" => "America/Indiana/Indianapolis" },
      { "label" => "Bogota", "value" => "America/Bogota" },
      { "label" => "Lima", "value" => "America/Lima" },
      { "label" => "Quito", "value" => "America/Lima" },
      { "label" => "Atlantic Time (Canada)", "value" => "America/Halifax" },
      { "label" => "Caracas", "value" => "America/Caracas" },
      { "label" => "La Paz", "value" => "America/La_Paz" },
      { "label" => "Santiago", "value" => "America/Santiago" },
      { "label" => "Newfoundland", "value" => "America/St_Johns" },
      { "label" => "Brasilia", "value" => "America/Sao_Paulo" },
      { "label" => "Buenos Aires", "value" => "America/Argentina/Buenos_Aires" },
      { "label" => "Montevideo", "value" => "America/Montevideo" },
      { "label" => "Georgetown", "value" => "America/Guyana" },
      { "label" => "Greenland", "value" => "America/Godthab" },
      { "label" => "Mid-Atlantic", "value" => "Atlantic/South_Georgia" },
      { "label" => "Azores", "value" => "Atlantic/Azores" },
      { "label" => "Cape Verde Is.", "value" => "Atlantic/Cape_Verde" },
      { "label" => "Dublin", "value" => "Europe/Dublin" },
      { "label" => "Edinburgh", "value" => "Europe/London" },
      { "label" => "Lisbon", "value" => "Europe/Lisbon" },
      { "label" => "London", "value" => "Europe/London" },
      { "label" => "Casablanca", "value" => "Africa/Casablanca" },
      { "label" => "Monrovia", "value" => "Africa/Monrovia" },
      { "label" => "UTC", "value" => "Etc/UTC" },
      { "label" => "Belgrade", "value" => "Europe/Belgrade" },
      { "label" => "Bratislava", "value" => "Europe/Bratislava" },
      { "label" => "Budapest", "value" => "Europe/Budapest" },
      { "label" => "Ljubljana", "value" => "Europe/Ljubljana" },
      { "label" => "Prague", "value" => "Europe/Prague" },
      { "label" => "Sarajevo", "value" => "Europe/Sarajevo" },
      { "label" => "Skopje", "value" => "Europe/Skopje" },
      { "label" => "Warsaw", "value" => "Europe/Warsaw" },
      { "label" => "Zagreb", "value" => "Europe/Zagreb" },
      { "label" => "Brussels", "value" => "Europe/Brussels" },
      { "label" => "Copenhagen", "value" => "Europe/Copenhagen" },
      { "label" => "Madrid", "value" => "Europe/Madrid" },
      { "label" => "Paris", "value" => "Europe/Paris" },
      { "label" => "Amsterdam", "value" => "Europe/Amsterdam" },
      { "label" => "Berlin", "value" => "Europe/Berlin" },
      { "label" => "Bern", "value" => "Europe/Zurich" },
      { "label" => "Zurich", "value" => "Europe/Zurich" },
      { "label" => "Rome", "value" => "Europe/Rome" },
      { "label" => "Stockholm", "value" => "Europe/Stockholm" },
      { "label" => "Vienna", "value" => "Europe/Vienna" },
      { "label" => "West Central Africa", "value" => "Africa/Algiers" },
      { "label" => "Bucharest", "value" => "Europe/Bucharest" },
      { "label" => "Cairo", "value" => "Africa/Cairo" },
      { "label" => "Helsinki", "value" => "Europe/Helsinki" },
      { "label" => "Kyiv", "value" => "Europe/Kiev" },
      { "label" => "Riga", "value" => "Europe/Riga" },
      { "label" => "Sofia", "value" => "Europe/Sofia" },
      { "label" => "Tallinn", "value" => "Europe/Tallinn" },
      { "label" => "Vilnius", "value" => "Europe/Vilnius" },
      { "label" => "Athens", "value" => "Europe/Athens" },
      { "label" => "Istanbul", "value" => "Europe/Istanbul" },
      { "label" => "Minsk", "value" => "Europe/Minsk" },
      { "label" => "Jerusalem", "value" => "Asia/Jerusalem" },
      { "label" => "Harare", "value" => "Africa/Harare" },
      { "label" => "Pretoria", "value" => "Africa/Johannesburg" },
      { "label" => "Kaliningrad", "value" => "Europe/Kaliningrad" },
      { "label" => "Moscow", "value" => "Europe/Moscow" },
      { "label" => "St. Petersburg", "value" => "Europe/Moscow" },
      { "label" => "Volgograd", "value" => "Europe/Volgograd" },
      { "label" => "Samara", "value" => "Europe/Samara" },
      { "label" => "Kuwait", "value" => "Asia/Kuwait" },
      { "label" => "Riyadh", "value" => "Asia/Riyadh" },
      { "label" => "Nairobi", "value" => "Africa/Nairobi" },
      { "label" => "Baghdad", "value" => "Asia/Baghdad" },
      { "label" => "Tehran", "value" => "Asia/Tehran" },
      { "label" => "Abu Dhabi", "value" => "Asia/Muscat" },
      { "label" => "Muscat", "value" => "Asia/Muscat" },
      { "label" => "Baku", "value" => "Asia/Baku" },
      { "label" => "Tbilisi", "value" => "Asia/Tbilisi" },
      { "label" => "Yerevan", "value" => "Asia/Yerevan" },
      { "label" => "Kabul", "value" => "Asia/Kabul" },
      { "label" => "Ekaterinburg", "value" => "Asia/Yekaterinburg" },
      { "label" => "Islamabad", "value" => "Asia/Karachi" },
      { "label" => "Karachi", "value" => "Asia/Karachi" },
      { "label" => "Tashkent", "value" => "Asia/Tashkent" },
      { "label" => "Chennai", "value" => "Asia/Kolkata" },
      { "label" => "Kolkata", "value" => "Asia/Kolkata" },
      { "label" => "Mumbai", "value" => "Asia/Kolkata" },
      { "label" => "New Delhi", "value" => "Asia/Kolkata" },
      { "label" => "Kathmandu", "value" => "Asia/Kathmandu" },
      { "label" => "Astana", "value" => "Asia/Dhaka" },
      { "label" => "Dhaka", "value" => "Asia/Dhaka" },
      { "label" => "Sri Jayawardenepura", "value" => "Asia/Colombo" },
      { "label" => "Almaty", "value" => "Asia/Almaty" },
      { "label" => "Novosibirsk", "value" => "Asia/Novosibirsk" },
      { "label" => "Rangoon", "value" => "Asia/Rangoon" },
      { "label" => "Bangkok", "value" => "Asia/Bangkok" },
      { "label" => "Hanoi", "value" => "Asia/Bangkok" },
      { "label" => "Jakarta", "value" => "Asia/Jakarta" },
      { "label" => "Krasnoyarsk", "value" => "Asia/Krasnoyarsk" },
      { "label" => "Beijing", "value" => "Asia/Shanghai" },
      { "label" => "Chongqing", "value" => "Asia/Chongqing" },
      { "label" => "Hong Kong", "value" => "Asia/Hong_Kong" },
      { "label" => "Urumqi", "value" => "Asia/Urumqi" },
      { "label" => "Kuala Lumpur", "value" => "Asia/Kuala_Lumpur" },
      { "label" => "Singapore", "value" => "Asia/Singapore" },
      { "label" => "Taipei", "value" => "Asia/Taipei" },
      { "label" => "Perth", "value" => "Australia/Perth" },
      { "label" => "Irkutsk", "value" => "Asia/Irkutsk" },
      { "label" => "Ulaanbaatar", "value" => "Asia/Ulaanbaatar" },
      { "label" => "Seoul", "value" => "Asia/Seoul" },
      { "label" => "Osaka", "value" => "Asia/Tokyo" },
      { "label" => "Sapporo", "value" => "Asia/Tokyo" },
      { "label" => "Tokyo", "value" => "Asia/Tokyo" },
      { "label" => "Yakutsk", "value" => "Asia/Yakutsk" },
      { "label" => "Darwin", "value" => "Australia/Darwin" },
      { "label" => "Adelaide", "value" => "Australia/Adelaide" },
      { "label" => "Canberra", "value" => "Australia/Melbourne" },
      { "label" => "Melbourne", "value" => "Australia/Melbourne" },
      { "label" => "Sydney", "value" => "Australia/Sydney" },
      { "label" => "Brisbane", "value" => "Australia/Brisbane" },
      { "label" => "Hobart", "value" => "Australia/Hobart" },
      { "label" => "Vladivostok", "value" => "Asia/Vladivostok" },
      { "label" => "Guam", "value" => "Pacific/Guam" },
      { "label" => "Port Moresby", "value" => "Pacific/Port_Moresby" },
      { "label" => "Magadan", "value" => "Asia/Magadan" },
      { "label" => "Srednekolymsk", "value" => "Asia/Srednekolymsk" },
      { "label" => "Solomon Is.", "value" => "Pacific/Guadalcanal" },
      { "label" => "New Caledonia", "value" => "Pacific/Noumea" },
      { "label" => "Fiji", "value" => "Pacific/Fiji" },
      { "label" => "Kamchatka", "value" => "Asia/Kamchatka" },
      { "label" => "Marshall Is.", "value" => "Pacific/Majuro" },
      { "label" => "Auckland", "value" => "Pacific/Auckland" },
      { "label" => "Wellington", "value" => "Pacific/Auckland" },
      { "label" => "Nuku\"alofa", "value" => "Pacific/Tongatapu" },
      { "label" => "Tokelau Is.", "value" => "Pacific/Fakaofo" },
      { "label" => "Chatham Is.", "value" => "Pacific/Chatham" },
      { "label" => "Samoa", "value" => "Pacific/Apia" }
    ]
  end

  PAYMENT_MODES = [
    { "label" => "Monthly", "value" => "monthly" },
    { "label" => "Quarterly", "value" => "quarterly" },
    { "label" => "Semi-Annual", "value" => "semi_annual" },
    { "label" => "Annual", "value" => "annual" }
  ]

  NOTIFICATION_TRIGGERS = [
    { "label" => "E-Ticket - Started", "value" => "eticket_created" },
    { "label" => "E-Ticket - Error", "value" => "eticket_error" },
    { "label" => "E-Ticket - Sent", "value" => "eticket_sent" },
    { "label" => "E-Application - New Application Started", "value" => "e_app_started" },
    { "label" => "E-Application - Error", "value" => "e_app_error" },
    { "label" => "E-Application - Application Completed", "value" => "e_app_completed" },
    { "label" => "Lead Created", "value" => "lead_created" },
    { "label" => "Lead Updated", "value" => "lead_updated" },
    { "label" => "Member Created", "value" => "member_created" },
    { "label" => "Underwriting Pre-screener Submitted", "value" => "uwp_created" },
    { "label" => "Carrier Forms Request", "value" => "forms_requested" }
  ]
end
