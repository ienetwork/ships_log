class ShipsLog < Rails::Railtie
  initializer "ships_log_initialization" do
    GUARANTEED_UNIVERSAL_LIFE_PRODUCTS = [
      "To age 121 (No Lapse U/L)",
      "To age 121 (Pay to 65)",
      "To age 121 (Pay to 100)",
      "To age 121 (20 Pay)",
      "To age 121 (10 Pay)",
      "To age 121 (Single Pay)"
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

    ROP_PRODUCTS = [
      "15 Year Term ROP",
      "20 Year Term ROP",
      "25 Year Term ROP",
      "30 Year Term ROP",
      "To age 65 (ROP)",
      "To age 70 (ROP)",
      "To age 75 (ROP)"
    ]

    SIMPLIFIED_ISSUE_PRODUCTS = [
      "10 Year Term Simplified Issue",
      "15 Year Term Simplified Issue",
      "20 Year Term Simplified Issue",
      "25 Year Term Simplified Issue",
      "30 Year Term Simplified Issue"
    ]

    HEALTH_CATEGORIES = [
      "Standard",
      "Standard Plus",
      "Preferred",
      "Preferred Plus"
    ]

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
      "Whole Life" => [],
      "Simplified Issue Term" => [
        "1 Year Term Simplified Issue",
        "5 Year Term Simplified Issue",
        "10 Year Term Simplified Issue",
        "12 Year Term Simplified Issue",
        "15 Year Term Simplified Issue",
        "16 Year Term Simplified Issue",
        "17 Year Term Simplified Issue",
        "18 Year Term Simplified Issue",
        "19 Year Term Simplified Issue",
        "20 Year Term Simplified Issue",
        "21 Year Term Simplified Issue",
        "22 Year Term Simplified Issue",
        "23 Year Term Simplified Issue",
        "24 Year Term Simplified Issue",
        "25 Year Term Simplified Issue",
        "26 Year Term Simplified Issue",
        "27 Year Term Simplified Issue",
        "28 Year Term Simplified Issue",
        "29 Year Term Simplified Issue",
        "30 Year Term Simplified Issue",
        "31 Year Term Simplified Issue",
        "32 Year Term Simplified Issue",
        "33 Year Term Simplified Issue",
        "34 Year Term Simplified Issue",
        "35 Year Term Simplified Issue",
        "40 Year Term Simplified Issue"
      ],
      "Final Expense" => ["Final Expense"]
    }

    ROLES = ["member", "sales_rep", "admin"]

    ANNUITY_PRODUCT_TYPES = ["Fixed Indexed","Multi-Year Guarantee (MYGA)","Single Premium Immediate (SPIA)","Traditional Fixed"]
    DISABILITY_PRODUCT_TYPES = ["Short Term","Long Term","Group","Supplemental Income"]
    LONG_TERM_CARE_PRODUCT_TYPES = ["Other"]
    LIFE_PRODUCT_TYPES = ["Term","Term ROP","UL","Whole Life","Simplified Issue Term","Final Expense"]
    LINES_OF_COVERAGE = ["Annuity","Life","Disability","Long Term Care"]

    IXN_HEALTH_CATEGORIES = ["Preferred Plus","Preferred","Standard Plus","Standard"]
    ALL_HEALTH_CATEGORIES = (IXN_HEALTH_CATEGORIES + ("A".."P").map { |letter| "Table #{letter}" }).freeze

    STATES = {
      "AL"=>"Alabama",
      "AK"=>"Alaska",
      "AS"=>"American Samoa",
      "AZ"=>"Arizona",
      "AR"=>"Arkansas",
      "CA"=>"California",
      "CO"=>"Colorado",
      "CT"=>"Connecticut",
      "DE"=>"Delaware",
      "DC"=>"District of Columbia",
      "FM"=>"Federated States of Micronesia",
      "FL"=>"Florida",
      "GA"=>"Georgia",
      "GU"=>"Guam",
      "HI"=>"Hawaii",
      "ID"=>"Idaho",
      "IL"=>"Illinois",
      "IN"=>"Indiana",
      "IA"=>"Iowa",
      "KS"=>"Kansas",
      "KY"=>"Kentucky",
      "LA"=>"Louisiana",
      "ME"=>"Maine",
      "MH"=>"Marshal Islands",
      "MD"=>"Maryland",
      "MA"=>"Massachusetts",
      "MI"=>"Michigan",
      "MN"=>"Minnesota",
      "MS"=>"Mississippi",
      "MO"=>"Missouri",
      "MT"=>"Montana",
      "NE"=>"Nebraska",
      "NV"=>"Nevada",
      "NH"=>"New Hampshire",
      "NJ"=>"New Jersey",
      "NM"=>"New Mexico",
      "NY"=>"New York",
      "NC"=>"North Carolina",
      "ND"=>"North Dakota",
      "MP"=>"Northern Mariana Islands",
      "OH"=>"Ohio",
      "OK"=>"Oklahoma",
      "OR"=>"Oregon",
      "PW"=>"Palau",
      "PA"=>"Pennsylvania",
      "PR"=>"Puerto Rico",
      "RI"=>"Rhode Island",
      "SC"=>"South Carolina",
      "SD"=>"South Dakota",
      "TN"=>"Tennessee",
      "TX"=>"Texas",
      "UT"=>"Utah",
      "VT"=>"Vermont",
      "VI"=>"Virgin Islands",
      "VA"=>"Virginia",
      "WA"=>"Washington",
      "WV"=>"West Virginia",
      "WI"=>"Wisconsin",
      "WY"=>"Wyoming"
    }

    STATE_SELECT_OPTIONS = []
    STATES.each { |abbr, full| STATE_SELECT_OPTIONS << [full, abbr] }

    QUOTE_ACTIONS = {
      "default" => "Webhook GET",
      "webhook_post" => "Webhook POST",
      "simple_url" => "Simple URL (No Data Payload)",
      "applicant" => "ApplicInt",
      "protective" => "Protective",
      "typeform" => "TypeForm",
      "formassembly" => "FormAssembly",
      "123_contact_form" => "123 Contact Form",
      "cognito_form" => "Cognito Form",
      "formsite" => "Formsite",
      "jotform" => "Jotform",
      "formstack" => "FormStack",
      "wufoo" => "Wufoo",
      "google_form" => "Google Form"
    }

    APPLICINT_CARRIERS = {
      "1500" => [
        "714",
        "708",
        "713",
        "712",
        "727",
        "709",
        "710",
        "711",
        "177",
        "178",
        "179",
        "180",
        "181"
      ],
      "139" => [
        "175",
        "2175",
        "2177",
        "2172",
        "2174",
        "2176",
        "2091",
        "2173",
        "1093",
        "1098",
        "1094",
        "1095",
        "1085",
        "1086",
        "1121",
        "1108",
        "1109",
        "176"
      ],
      "140" => [
        "120",
        "118",
        "119",
        "129",
        "134",
        "557",
        "558",
        "559",
        "561",
        "1987",
        "1988",
        "1989",
        "1990",
        "1991",
        "1992",
        "1993",
        "1994",
        "1995",
        "1996",
        "1997",
        "1998",
        "1999"
      ],
      "111" => [
        "157",
        "158",
        "159",
        "2092",
        "161"
      ],
      "186" => [
        "687",
        "688",
        "689",
        "690",
        "691"
      ],
      "49" => [
        "875",
        "876",
        "877",
        "2065",
        "2066",
        "880",
        "883",
        "885"
      ],
      "99" => [
        "1228",
        "2025",
        "2026",
        "2027",
        "2028",
        "2029",
        "1224",
        "1227",
        "1932",
        "1933",
        "1934"
      ],
      "1700" => [

      ],
      "69" => [
        "39",
        "40",
        "1412",
        "42",
        "43",
        "1383",
        "1384",
        "1385",
        "53",
        "54",
        "1380",
        "1389",
        "1403",
        "1404",
        "1388"
      ],
      "193" => [
        "1472",
        "1473",
        "1474",
        "1475",
        "1476"
      ],
      "92" => [
        "1757",
        "1750",
        "1758",
        "1751",
        "1759",
        "1752",
        "1760",
        "1754",
        "1755"
      ],
      "194" => [
        "1950",
        "1951",
        "1952",
        "1731",
        "1732",
        "1968",
        "1969",
        "1970",
        "1971",
        "1973",
        "1976",
        "1975",
        "1974"
      ],
      "195" => [
        "166",
        "167",
        "168",
        "2100",
        "169"
      ]
    }

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
            "RIDER_RATE"
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
            "RIDER_RATE"
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
      { label => "International Date Line West", value => "Pacific/Midway" },
      { label => "Midway Island", value => "Pacific/Midway" },
      { label => "American Samoa", value => "Pacific/Pago_Pago" },
      { label => "Hawaii", value => "Pacific/Honolulu" },
      { label => "Alaska", value => "America/Juneau" },
      { label => "Pacific Time (US & Canada)", value => "America/Los_Angeles" },
      { label => "Tijuana", value => "America/Tijuana" },
      { label => "Mountain Time (US & Canada)", value => "America/Denver" },
      { label => "Arizona", value => "America/Phoenix" },
      { label => "Chihuahua", value => "America/Chihuahua" },
      { label => "Mazatlan", value => "America/Mazatlan" },
      { label => "Central Time (US & Canada)", value => "America/Chicago" },
      { label => "Saskatchewan", value => "America/Regina" },
      { label => "Guadalajara", value => "America/Mexico_City" },
      { label => "Mexico City", value => "America/Mexico_City" },
      { label => "Monterrey", value => "America/Monterrey" },
      { label => "Central America", value => "America/Guatemala" },
      { label => "Eastern Time (US & Canada)", value => "America/New_York" },
      { label => "Indiana (East)", value => "America/Indiana/Indianapolis" },
      { label => "Bogota", value => "America/Bogota" },
      { label => "Lima", value => "America/Lima" },
      { label => "Quito", value => "America/Lima" },
      { label => "Atlantic Time (Canada)", value => "America/Halifax" },
      { label => "Caracas", value => "America/Caracas" },
      { label => "La Paz", value => "America/La_Paz" },
      { label => "Santiago", value => "America/Santiago" },
      { label => "Newfoundland", value => "America/St_Johns" },
      { label => "Brasilia", value => "America/Sao_Paulo" },
      { label => "Buenos Aires", value => "America/Argentina/Buenos_Aires" },
      { label => "Montevideo", value => "America/Montevideo" },
      { label => "Georgetown", value => "America/Guyana" },
      { label => "Greenland", value => "America/Godthab" },
      { label => "Mid-Atlantic", value => "Atlantic/South_Georgia" },
      { label => "Azores", value => "Atlantic/Azores" },
      { label => "Cape Verde Is.", value => "Atlantic/Cape_Verde" },
      { label => "Dublin", value => "Europe/Dublin" },
      { label => "Edinburgh", value => "Europe/London" },
      { label => "Lisbon", value => "Europe/Lisbon" },
      { label => "London", value => "Europe/London" },
      { label => "Casablanca", value => "Africa/Casablanca" },
      { label => "Monrovia", value => "Africa/Monrovia" },
      { label => "UTC", value => "Etc/UTC" },
      { label => "Belgrade", value => "Europe/Belgrade" },
      { label => "Bratislava", value => "Europe/Bratislava" },
      { label => "Budapest", value => "Europe/Budapest" },
      { label => "Ljubljana", value => "Europe/Ljubljana" },
      { label => "Prague", value => "Europe/Prague" },
      { label => "Sarajevo", value => "Europe/Sarajevo" },
      { label => "Skopje", value => "Europe/Skopje" },
      { label => "Warsaw", value => "Europe/Warsaw" },
      { label => "Zagreb", value => "Europe/Zagreb" },
      { label => "Brussels", value => "Europe/Brussels" },
      { label => "Copenhagen", value => "Europe/Copenhagen" },
      { label => "Madrid", value => "Europe/Madrid" },
      { label => "Paris", value => "Europe/Paris" },
      { label => "Amsterdam", value => "Europe/Amsterdam" },
      { label => "Berlin", value => "Europe/Berlin" },
      { label => "Bern", value => "Europe/Zurich" },
      { label => "Zurich", value => "Europe/Zurich" },
      { label => "Rome", value => "Europe/Rome" },
      { label => "Stockholm", value => "Europe/Stockholm" },
      { label => "Vienna", value => "Europe/Vienna" },
      { label => "West Central Africa", value => "Africa/Algiers" },
      { label => "Bucharest", value => "Europe/Bucharest" },
      { label => "Cairo", value => "Africa/Cairo" },
      { label => "Helsinki", value => "Europe/Helsinki" },
      { label => "Kyiv", value => "Europe/Kiev" },
      { label => "Riga", value => "Europe/Riga" },
      { label => "Sofia", value => "Europe/Sofia" },
      { label => "Tallinn", value => "Europe/Tallinn" },
      { label => "Vilnius", value => "Europe/Vilnius" },
      { label => "Athens", value => "Europe/Athens" },
      { label => "Istanbul", value => "Europe/Istanbul" },
      { label => "Minsk", value => "Europe/Minsk" },
      { label => "Jerusalem", value => "Asia/Jerusalem" },
      { label => "Harare", value => "Africa/Harare" },
      { label => "Pretoria", value => "Africa/Johannesburg" },
      { label => "Kaliningrad", value => "Europe/Kaliningrad" },
      { label => "Moscow", value => "Europe/Moscow" },
      { label => "St. Petersburg", value => "Europe/Moscow" },
      { label => "Volgograd", value => "Europe/Volgograd" },
      { label => "Samara", value => "Europe/Samara" },
      { label => "Kuwait", value => "Asia/Kuwait" },
      { label => "Riyadh", value => "Asia/Riyadh" },
      { label => "Nairobi", value => "Africa/Nairobi" },
      { label => "Baghdad", value => "Asia/Baghdad" },
      { label => "Tehran", value => "Asia/Tehran" },
      { label => "Abu Dhabi", value => "Asia/Muscat" },
      { label => "Muscat", value => "Asia/Muscat" },
      { label => "Baku", value => "Asia/Baku" },
      { label => "Tbilisi", value => "Asia/Tbilisi" },
      { label => "Yerevan", value => "Asia/Yerevan" },
      { label => "Kabul", value => "Asia/Kabul" },
      { label => "Ekaterinburg", value => "Asia/Yekaterinburg" },
      { label => "Islamabad", value => "Asia/Karachi" },
      { label => "Karachi", value => "Asia/Karachi" },
      { label => "Tashkent", value => "Asia/Tashkent" },
      { label => "Chennai", value => "Asia/Kolkata" },
      { label => "Kolkata", value => "Asia/Kolkata" },
      { label => "Mumbai", value => "Asia/Kolkata" },
      { label => "New Delhi", value => "Asia/Kolkata" },
      { label => "Kathmandu", value => "Asia/Kathmandu" },
      { label => "Astana", value => "Asia/Dhaka" },
      { label => "Dhaka", value => "Asia/Dhaka" },
      { label => "Sri Jayawardenepura", value => "Asia/Colombo" },
      { label => "Almaty", value => "Asia/Almaty" },
      { label => "Novosibirsk", value => "Asia/Novosibirsk" },
      { label => "Rangoon", value => "Asia/Rangoon" },
      { label => "Bangkok", value => "Asia/Bangkok" },
      { label => "Hanoi", value => "Asia/Bangkok" },
      { label => "Jakarta", value => "Asia/Jakarta" },
      { label => "Krasnoyarsk", value => "Asia/Krasnoyarsk" },
      { label => "Beijing", value => "Asia/Shanghai" },
      { label => "Chongqing", value => "Asia/Chongqing" },
      { label => "Hong Kong", value => "Asia/Hong_Kong" },
      { label => "Urumqi", value => "Asia/Urumqi" },
      { label => "Kuala Lumpur", value => "Asia/Kuala_Lumpur" },
      { label => "Singapore", value => "Asia/Singapore" },
      { label => "Taipei", value => "Asia/Taipei" },
      { label => "Perth", value => "Australia/Perth" },
      { label => "Irkutsk", value => "Asia/Irkutsk" },
      { label => "Ulaanbaatar", value => "Asia/Ulaanbaatar" },
      { label => "Seoul", value => "Asia/Seoul" },
      { label => "Osaka", value => "Asia/Tokyo" },
      { label => "Sapporo", value => "Asia/Tokyo" },
      { label => "Tokyo", value => "Asia/Tokyo" },
      { label => "Yakutsk", value => "Asia/Yakutsk" },
      { label => "Darwin", value => "Australia/Darwin" },
      { label => "Adelaide", value => "Australia/Adelaide" },
      { label => "Canberra", value => "Australia/Melbourne" },
      { label => "Melbourne", value => "Australia/Melbourne" },
      { label => "Sydney", value => "Australia/Sydney" },
      { label => "Brisbane", value => "Australia/Brisbane" },
      { label => "Hobart", value => "Australia/Hobart" },
      { label => "Vladivostok", value => "Asia/Vladivostok" },
      { label => "Guam", value => "Pacific/Guam" },
      { label => "Port Moresby", value => "Pacific/Port_Moresby" },
      { label => "Magadan", value => "Asia/Magadan" },
      { label => "Srednekolymsk", value => "Asia/Srednekolymsk" },
      { label => "Solomon Is.", value => "Pacific/Guadalcanal" },
      { label => "New Caledonia", value => "Pacific/Noumea" },
      { label => "Fiji", value => "Pacific/Fiji" },
      { label => "Kamchatka", value => "Asia/Kamchatka" },
      { label => "Marshall Is.", value => "Pacific/Majuro" },
      { label => "Auckland", value => "Pacific/Auckland" },
      { label => "Wellington", value => "Pacific/Auckland" },
      { label => "Nuku\"alofa", value => "Pacific/Tongatapu" },
      { label => "Tokelau Is.", value => "Pacific/Fakaofo" },
      { label => "Chatham Is.", value => "Pacific/Chatham" },
      { label => "Samoa", value => "Pacific/Apia" }
    ]
  end
end
