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
      "google_form" => "Google Form",
      "ixn_lead_form" => "IXN Lead Form"
    }

    PROTECTIVE_ETICKET_SUPPORTED_PRODUCTS = [42, 39, 2161, 2164, 40, 2162, 2163, 2165, 1412, 43]

    APPLICINT_CARRIERS = {
      140 => {
        "code" => "AMGE" # American General,
        "products" => {
          120 => {
            "code" => "ATRG",
            "name" => "Select-a-Term - 10 Year (2016)"
          },
          118 => {
            "code" => "ATRG",
            "name" => "Select-a-Term - 15 Year (2016)"
          },
          119 => {
            "code" => "ATRG",
            "name" => "Select-a-Term - 20 Year (2016)"
          },
          129 => {
            "code" => "ATRG",
            "name" => "Select-a-Term - 25 Year (2016)"
          },
          134 => {
            "code" => "ATRG",
            "name" => "Select-a-Term - 30 Year (2016)"
          }
          # "" => {
          #   "code" => "ARTG",
          #   "name" => "ROP Select-a-Term - 20 Year"
          # },
          # "" => {
          #   "code" => "ARTG",
          #   "name" => "ROP Select-a-Term - 25 Year"
          # },
          # "" => {
          #   "code" => "ARTG",
          #   "name" => "ROP Select-a-Term - 30 Year"
          # }
        }
      },
      111 => {
        "code" => "BANN",
        "products" => {
          157 => {
            "code" => "BONS",
            "name" => "OPTerm 10 - 10 Year Term"
          },
          158 => {
            "code" => "BONS",
            "name" => "OPTerm 15 - 15 Year Term"
          },
          159 => {
            "code" => "BONS",
            "name" => "OPTerm 20 - 20 Year"
          },
          2092 => {
            "code" => "BONS",
            "name" => "OPTerm 25 - 25 Year"
          },
          161 => {
            "code" => "BONS",
            "name" => "OPTerm 30 - 30 Year Term"
          }
        }
      },
      186 => {
        "code" => "CETN",
        "products" => {
          687 => {
            "code" => "CETN",
            "name" => "T-10/10 - 10 Year Term"
          },
          688 => {
            "code" => "CETN",
            "name" => "T-15/15 - 15 Year Term"
          },
          689 => {
            "code" => "CETN",
            "name" => "T-20/20 - 20 Year Term"
          },
          690 => {
            "code" => "CETN",
            "name" => "T-25/25 - 25 Year Term"
          },
          691 => {
            "code" => "CETN",
            "name" => "T-30/30 - 30 Year Term"
          }
          # "" => {
          #   "code" => "WHOLE_LIFE",
          #   "name" => "Whole life"
          # }
        }
      },
      49 => {
        "code" => "JOHU",
        "products" => {
          # "" => {
          #   "code" => "JHT17R",
          #   "name" => "Term 10",
          # "" => {
          #   "code" => "JHT17R",
          #   "name" => "Term 15",
          # "" => {
          #   "code" => "JHT17R",
          #   "name" => "Term 20",
          # "" => {
          #   "code" => "JHT17R",
          #   "name" => "Term 10 (UPR)",
          # "" => {
          #   "code" => "JHT17R",
          #   "name" => "Term 15 (UPR)",
          # "" => {
          #   "code" => "JHT17R",
          #   "name" => "Term 20 (UPR)",
          # "" => {
          #   "code" => "JHT17VR",
          #   "name" => "Term 10 with Vitality",
          # "" => {
          #   "code" => "JHT17VR",
          #   "name" => "Term 15 with Vitality",
          # "" => {
          #   "code" => "JHT17VR",
          #   "name" => "Term 20 with Vitality",
          # "" => {
          #   "code" => "JHT17VR",
          #   "name" => "Term 10 with Vitality (UPR)",
          # "" => {
          #   "code" => "JHT17VR",
          #   "name" => "Term 15 with Vitality (UPR)",
          # "" => {
          #   "code" => "JHT17VR",
          #   "name" => "Term 20 with Vitality (UPR)"
          875 => {
            "code" => "JHT18",
            "name" => "Term 10"
          },
          876 => {
            "code" => "JHT18",
            "name" => "Term 15"
          },
          877 => {
            "code" => "JHT18",
            "name" => "Term 20"
          },
          # "" => {
          #   "code" => "JHT18",
          #   "name" => "Term 10 (UPR)",
          # "" => {
          #   "code" => "JHT18",
          #   "name" => "Term 15 (UPR)",
          # "" => {
          #   "code" => "JHT18",
          #   "name" => "Term 20 (UPR)"
          2251 => {
            "code" => "JHT18",
            "name" => "Term 10 (HER)"
          },
          2252 => {
            "code" => "JHT18",
            "name" => "Term 15 (HER)"
          },
          2253 => {
            "code" => "JHT18",
            "name" => "Term 20 (HER)"
          },
          880 => {
            "code" => "JHT18V",
            "name" => "Term 10 with Vitality"
          },
          883 => {
            "code" => "JHT18V",
            "name" => "Term 15 with Vitality"
          },
          885 => {
            "code" => "JHT18V",
            "name" => "Term 20 with Vitality"
          }
          # "" => {
          #   "code" => "JHT18V",
          #   "name" => "Term 10 with Vitality (UPR)",
          # "" => {
          #   "code" => "JHT18V",
          #   "name" => "Term 15 with Vitality (UPR)",
          # "" => {
          #   "code" => "JHT18V",
          #   "name" => "Term 20 with Vitality (UPR)",
        }
      },
      69 => {
        "code" => "PROT",
        "products" => {
          2161 => {
            "code" => "PROT",
            "name" => "Protective Classic Choice Term 10"
          },
          2162 => {
            "code" => "PROT",
            "name" => "Protective Classic Choice Term 15"
          },
          2163 => {
            "code" => "PROT",
            "name" => "Protective Classic Choice Term 20"
          },
          2164 => {
            "code" => "PROT",
            "name" => "Protective Classic Choice Term 25"
          },
          2165 => {
            "code" => "PROT",
            "name" => "Protective Classic Choice Term 30"
          },
          39 => {
            "code" => "PTCL",
            "name" => "Custom Choice UL - 10 Year No Lapse"
          },
          40 => {
            "code" => "PTCL",
            "name" => "Custom Choice UL - 15 Year No Lapse"
          },
          1412 => {
            "code" => "PTCL",
            "name" => "Custom Choice No Lapse UL - 20 Year"
          },
          42 => {
            "code" => "PTCL",
            "name" => "Custom Choice UL - 25 Year No Lapse"
          },
          43 => {
            "code" => "PTCL",
            "name" => "Custom Choice UL - 30 Year No Lapse"
          },
          # "" => {
          #   "code" => "PROT_IUL",
          #   "name" => "Indexed Choice UL"
          1383 => {
            "code" => "PTAL",
            "name" => "Advantage Choice UL 2/16 - to age 90"
          },
          1384 => {
            "code" => "PTAL",
            "name" => "Advantage Choice UL 2/16 - to age 95"
          },
          1385 => {
            "code" => "PTAL",
            "name" => "Advantage Choice UL 2/16 - to age 100"
          },
          53 => {
            "code" => "PTAL",
            "name" => "Advantage Choice UL 2/16 - to age 105"
          },
          54 => {
            "code" => "PTAL",
            "name" => "Advantage Choice UL 2/16 - to age 110"
          },
          1380 => {
            "code" => "PTAL",
            "name" => "Advantage Choice UL 2/16 - to age 121"
          },
          1389 => {
            "code" => "PTAL",
            "name" => "Advantage Choice UL 2/16 - Pay to 65"
          },
          1403 => {
            "code" => "PTAL",
            "name" => "Advantage Choice UL 2/16 - 20 Pay"
          },
          1404 => {
            "code" => "PTAL",
            "name" => "Advantage Choice UL 2/16 - 10 Pay"
          },
          1388 => {
            "code" => "PTAL",
            "name" => "Advantage Choice UL 2/16 - Single Pay"
          }
        }
      },
      193 => {
        "code" => "SAVE",
        "products" => {
          1472 => {
            "code" => "SAVE",
            "name" => "T-10/10 - 10 Year Term"
          },
          1473 => {
            "code" => "SAVE",
            "name" => "T-15/15 - 15 Year Term"
          },
          1474 => {
            "code" => "SAVE",
            "name" => "T-20/20 - 20 Year Term"
          },
          1475 => {
            "code" => "SAVE",
            "name" => "T-25/25 - 25 Year Term"
          },
          1476 => {
            "code" => "SAVE",
            "name" => "T-30/30 - 30 Year Term"
          }
          # "" => {
          #   "code" => "WHOLE_LIFE",
          #   "name" => "Whole life",
        }
      },
      92 => {
        "code" => "UTOM",
        "products" => {
          1757 => {
            "code" => "UTPP",
            "name" => "Term Life Answers 10"
          },
          1750 => {
            "code" => "UTEP",
            "name" => "SI - Term Life Express - 10 Year"
          },
          1758 => {
            "code" => "UTPP",
            "name" => "Term Life Answers 15"
          },
          1751 => {
            "code" => "UTEP",
            "name" => "SI - Term Life Express - 15 Year"
          },
          1759 => {
            "code" => "UTPP",
            "name" => "Term Life Answers 20"
          },
          1752 => {
            "code" => "UTEP",
            "name" => "SI - Term Life Express - 20 Year"
          },
          1760 => {
            "code" => "UTPP",
            "name" => "Term Life Answers 30"
          },
          1754 => {
            "code" => "UTEP",
            "name" => "SI - Term Life Express - 20 Year w/ROP"
          },
          1755 => {
            "code" => "UTEP",
            "name" => "SI - Term Life Express - 30 Year w/ROP"
          }
        }
      },
      195 => {
        "code" => "WILP",
        "products" => {
          166 => {
            "code" => "WOLR",
            "name" => "OpTerm 10"
          },
          167 => {
            "code" => "WOLR",
            "name" => "OpTerm 15"
          },
          168 => {
            "code" => "WOLR",
            "name" => "OpTerm 20"
          },
          2100 => {
            "code" => "WOLR",
            "name" => "OpTerm 25"
          },
          169 => {
            "code" => "WOLR",
            "name" => "OpTerm 30"
          }
        }
      },
      99 => {
        "code" => "PACL",
        "products" => {
          # "" => {
          #   "code" => "PACL",
          #   "name" => "Pacific-ART - Annual Renewable Term"
          2025 => {
            "code" => "PCPL",
            "name" => "PL Promise Term 10"
          },
          2026 => {
            "code" => "PCPL",
            "name" => "PL Promise Term 15"
          },
          2027 => {
            "code" => "PCPL",
            "name" => "PL Promise Term 20"
          },
          2028 => {
            "code" => "PCPL",
            "name" => "PL Promise Term 25"
          },
          2029 => {
            "code" => "PCPL",
            "name" => "PL Promise Term 30"
          }
        }
      },
      1700 => {
        "code" => "PACK",
        "products" => {
          1224 => {
            "code" => "PACL",
            "name" => "Pacific-ART-NY - Annual Renewable Term"
          },
          # " => {
          #   "code" => "PCAS",
          #   "name" => "Pacific PRIME Term 10 NY (age 18-60 Std)"
          1227 => {
            "code" => "PCAL",
            "name" => "Pacific PRIME Term 10 NY"
          },
          1932 => {
            "code" => "PCAL",
            "name" => "Pacific PRIME Term 15 NY"
          },
          1933 => {
            "code" => "PCAL",
            "name" => "Pacific PRIME Term 20 NY"
          },
          1934 => {
            "code" => "PCAL",
            "name" => "Pacific PRIME Term 30 NY"
          }
        }
      },
      194 => {
        "code" => "UTST",
        "products" => {
          1950 => {
            "code" => "USED",
            "name" => "Select-a-Term - 10 Year  (2016)"
          },
          1951 => {
            "code" => "USED",
            "name" => "Select-a-Term - 15 Year  (2016)"
          },
          1952 => {
            "code" => "USED",
            "name" => "Select-a-Term - 20 Year  (2016)"
          },
          1731 => {
            "code" => "USED",
            "name" => "Select-a-Term - 25 Year  (2016)"
          },
          1732 => {
            "code" => "USED",
            "name" => "Select-a-Term - 30 Year  (2016)"
          }
        }
      },
      139 => {
        "code" => "NORA",
        "products" => {
          1085 => {
            "code" => "NDGA",
            "name" => "ADDvantage 10"
          },
          1086 => {
            "code" => "NDGA",
            "name" => "ADDvantage 15"
          },
          175 => {
            "code" => "NDGA",
            "name" => "ADDvantage 20"
          },
          176 => {
            "code" => "NDGA",
            "name" => "ADDvantage 30"
          }
          # "" => {
          #   "code" => "NGGA",
          #   "name" => "Custom Guarantee Gen 8 ($25-249K)",
          # "" => {
          #   "code" => "NGGA",
          #   "name" => "Custom Guarantee Gen 8 - 1 pay ($25K+)",
          # "" => {
          #   "code" => "NGGA",
          #   "name" => "Custom Guarantee Gen 8 - 10p ($25K+)",
          # "" => {
          #   "code" => "NGGA",
          #   "name" => "Custom Guarantee Gen 8 - 20p ($25K+)",
          # "" => {
          #   "code" => "NGGA",
          #   "name" => "Custom Guarantee Gen 8 - p100 ($25K+)",
          # "" => {
          #   "code" => "NGGA",
          #   "name" => "Custom Guarantee Gen 8 - p65 ($25K+)",
          # "" => {
          #   "code" => "NGGA",
          #   "name" => "Custom Guarantee Gen 8 to 90 ($25K+)",
          # "" => {
          #   "code" => "NGGA",
          #   "name" => "Custom Guarantee Gen 8 to 95 ($25K+)",
          # "" => {
          #   "code" => "NHGA",
          #   "name" => "Custom Guarantee Gen 8 ($250K plus)",
          # "" => {
          #   "code" => "NHGA",
          #   "name" => "Custom Guarantee Gen 8 - 1 pay ($250K+)",
          # "" => {
          #   "code" => "NHGA",
          #   "name" => "Custom Guarantee Gen 8 - 10p ($250K+)",
          # "" => {
          #   "code" => "NHGA",
          #   "name" => "Custom Guarantee Gen 8 - 20p ($250K+)",
          # "" => {
          #   "code" => "NHGA",
          #   "name" => "Custom Guarantee Gen 8 - p100 ($250K+)",
          # "" => {
          #   "code" => "NHGA",
          #   "name" => "Custom Guarantee Gen 8 - p65 ($250K+)",
          # "" => {
          #   "code" => "NHGA",
          #   "name" => "Custom Guarantee Gen 8 to 90 ($250K+)",
          # "" => {
          #   "code" => "NHGA",
          #   "name" => "Custom Guarantee Gen 8 to 95 ($250K+)",
          # "" => {
          #   "code" => "NPGA",
          #   "name" => "Guarantee Builder IUL4 ($250K plus)",
          # "" => {
          #   "code" => "NPGA",
          #   "name" => "Guarantee Builder IUL4 ($250K+)",
          # "" => {
          #   "code" => "NPGA",
          #   "name" => "Guarantee Builder IUL4 to 90 ($250K+)",
          # "" => {
          #   "code" => "NPGA",
          #   "name" => "Guarantee Builder IUL4 to 95 ($250K+)",
          # "" => {
          #   "code" => "NUGA",
          #   "name" => "Guarantee Builder IUL4 ($25-249K)",
          # "" => {
          #   "code" => "NUGA",
          #   "name" => "Guarantee Builder IUL4 to 90 ($25-$249K)",
          # "" => {
          #   "code" => "NUGA",
          #   "name" => "Guarantee Builder IUL4 to 95 ($25-$249K)",
        }
      },
      1500 => {
        "code" => "CINN",
        "products" => {
          # "" => {
          #   "code" => "CICN",
          #   "name" => "LifeSetter UL - pay to 100 (CA)"
          714 => {
            "code" => "CINN",
            "name" => "LifeHorizons Guaranteed W/L - 10 Pay"
          },
          713 => {
            "code" => "CINN",
            "name" => "LifeHorizons Guaranteed W/L - Pay 65"
          },
          #  => {
          #   "code" => "CINN",
          #   "name" => "LifeHorizons Guaranteed W/L - Pay to 100"
          712 => {
            "code" => "CINN",
            "name" => "LifeHorizons Guaranteed W/L - Single Pay"
          },
          177 => {
            "code" => "CINN",
            "name" => "LifeHorizons Termsetter 10"
          },
          178 => {
            "code" => "CINN",
            "name" => "LifeHorizons Termsetter 15"
          },
          179 => {
            "code" => "CINN",
            "name" => "LifeHorizons Termsetter 20"
          },
          180 => {
            "code" => "CINN",
            "name" => "LifeHorizons Termsetter 25"
          },
          181 => {
            "code" => "CINN",
            "name" => "LifeHorizons Termsetter 30"
          },
          709 => {
            "code" => "CINN",
            "name" => "Termsetter ROP 20 Year"
          },
          710 => {
            "code" => "CINN",
            "name" => "Termsetter ROP 25 Year (w/ROP)"
          },
          711 => {
            "code" => "CINN",
            "name" => "Termsetter ROP 30 Year (w/ROP)"
          },
          #  => {
          #   "code" => "CINN_SUL",
          #   "name" => "LifeHorizons Simplicity UL"
          727 => {
            "code" => "CIUN",
            "name" => "LifeSetter UL - pay to 100"
          }
        }
      }
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
    { "label" => "E-ticket Created", "value" => "eticket_created" },
    { "label" => "E-ticket Sent", "value" => "eticket_sent" },
    { "label" => "E-ticket Error", "value" => "eticket_error" },
    { "label" => "Lead Created", "value" => "lead_created" },
    { "label" => "Lead Updated", "value" => "lead_updated" },
    { "label" => "Member Created", "value" => "member_created" },
    { "label" => "Underwriting Pre-screener Submitted", "value" => "uwp_created" }
  ]
end
