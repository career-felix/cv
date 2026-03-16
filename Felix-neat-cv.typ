#import "@preview/neat-cv:0.7.0": (
  contact-info, cv, email-link, entry, item-pills, item-with-level, publications, side, social-links,
)
#import "@preview/fontawesome:0.6.0": *

#set text(lang: "en")

#let entry(
  /// Institution or company logo
  /// -> string
  logo: none,
  /// Institution or company
  /// -> string
  institution: none,
  /// Entry title
  /// -> string | none
  title: none,
  /// Date or range
  /// -> string
  date: "",
  /// Location
  /// -> string
  location: none,
  /// Description/details
  /// -> content
  description,
) = {
  let __st-theme = state("theme")

  let __above = if institution != none {0.85em} else {0em}
  let __below = if institution != none {0.85em} else {0em}
  context block(above: __above, below: __below)[
    #let theme = __st-theme.final()

    #set text(size: 0.85em)

    #if logo != none [
      #grid(
        columns: (auto, auto),
        align: (right, left + bottom),
        column-gutter: .8em,
        if type(logo) == str [
          #image(logo, height: 0.55cm)
        ] else [
          #logo
        ],
        [
          #text(weight: "semibold", institution)
        ],
      )
    ] else if institution != none [
      #text(weight: "semibold", institution)
    ]

    #if title != none {
      block(below: 0.85em, [
        #text(font: "DejaVu Sans Mono", size: 0.93em, title)
        #h(1fr)
        #if location != "" [
          #fa-icon("calendar-alt", size: 0.88em, fill: theme.accent-color)
          #text(size: 0.82em, fill: theme.font-color.lighten(33%), date)
        ]
      ])
    }

    #set par(first-line-indent: 1.8em, leading: 0.25cm)
    #text(size: 0.93em, description)
  ]
}


#show: cv.with(
  author: (
    firstname: "Felix Wu",
    lastname: "",
    email: "career.felix@gmail.com",
    phone: "(852) 6259 1762",
    position: ("Fin Tech", "Low Latency Programming"),
    // website: "",
    // twitter: "",
    // mastodon: "",
    // matrix: "",
    // github: "",
    // gitlab: "",
    // researchgate: "",
    // scholar: "",
    // orcid: "",
    custom-links: (
      (
        icon-name: "whatsapp",
        label: "WhatsApp",
        url: "https://wa.me/85262591762",
      ),
    ),
    linkedin: "career-felix",
  ),
  profile-picture: image("resources/Felix-2025.jpg"),
  accent-color: rgb("#036abc"),
  // font-color: rgb("#333333"),
  header-color: rgb("#333388"),
  // date: auto,
  // heading-font: "Fira Sans",
  // body-font: ("Noto Sans", "Roboto"),
  // body-font-size: 10.5pt,
  // paper-size: "us-letter",
  // side-width: 4cm,
  // gdpr: false,
  // footer: auto,
)


#side[
  = About me
  - 20+ years Hands-on Java
  - #link("https://drive.google.com/file/d/1-kag_AnGbPOxxa9kRZQW80xx5g31CtPp/view")[10-year Project Management]
  - Agile Practitioner
  - Architecture Design of Distributed Systems with High Availability and Low Latency

  = Skill Set
  #item-with-level("AI Adoption / Copilot", 4)
  #item-with-level("Core Java", 5)
  #item-with-level("Micro-Service / RESTful API", 5)
  #item-with-level("Relational DB / NoSQL", 4)

  = Personal
  - #box(image("resources/Flag_of_Australia-128x64.png", height: 0.70em)) #link("https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/national-innovation-visa-858")[Australian PR]
  - #box(image("resources/Flag_of_Hong_Kong-128x85.png", height: 0.75em)) Hong Kong PR

  = Notice Period
  - 3 Months

  = Contact
  #contact-info()
  #v(1fr)
  #social-links()

  // Use colbreak() to insert a page break
  #colbreak()

  = #fa-icon("language") Languages
  #item-with-level("English", 4, subtitle: "IELTS Academic 7.5")
  #item-with-level("Japanese", 3, subtitle: "JLPT N2")
  #item-with-level("Chinese", 5, subtitle: "Native")

  = Other Skills
  #item-pills((
    "Holistic System Design",
    "Creative Problem Solving",
    "Mentoring Juniors",
  ))

  #v(1fr)
  #text(size: 0.88em, fill: rgb("#999999"))[
    Created with #link("https://typst.app/")[typst].

    Source code available on #link("https://github.com/career-felix/cv")[Github].
  ]
]


= Experience

#entry(
  logo: box(image("resources/MorganStanley.png", height: 0.666cm)),
  institution: "Morgan Stanley Bank Asia Limited",
  title: "Vice President, PWM Asia & Australia",
  date: "Aug 2021 — Present",
  location: "Hong Kong",
)[
  - Currently working in PWM Trading Squad, responsible for STP FX system and New Issue Subscription (IPO) system. Designing the solution and creating markdowns to instruct AI to generate code and conduct testing.

  - Led a squad with up to 13 people to develop an entitlement management system to replace the two-decade-old legacy one. The new system was built from scratch applying the new entitlement model. It is now serving entitlements to all 80+ applications across the business unit. As the IT System Owner (ITSO) & Scrum Master, I was in charge of requirement clarification, architecture design, project planning and agile team leading. And I implemented some core components as well, such as approval calculation engine.
]\


#entry(
  logo: "resources/ChinaCITICBankIntl.png",
  institution: "China CITIC Bank International Limited",
  date: "Sep 2019 — Jul 2021",
  title: "Digital Transformation Engineer",
  location: "Hong Kong",
)[
  - #link("https://www.hkma.gov.hk/eng/")[HKMA] started to issue licenses to virtual banks since 2019. To keep pace with the FinTech evolvement, CNCBI launched its digital bank brand - #{
    show link: set text(fill: blue)
    show link: underline
    [#link("https://www.cncbinternational.com/personal/e-banking/inmotion/en/index.html")[inMotion]]
  }. All retail banking services to be migrated to the all-in-one inMotion app.

  - I was responsible for back-end systems for FX-related products. My duty included design, coding, integration with upstream and downstream systems, and production support (Level 3). Our squad (5 people) completed the following MVPs:

    --- Currency-Linked Deposit (CLD)

    --- Cross-currency FX Trading

    --- Bank Notes Pre-Ordering

    --- Online FX Customer Experience Enhancement
]\


#entry(
  institution: "Bruida InfoTech (Shanghai) Co., Ltd.",
  title: "Lead Architect",
  date: "Apr 2019 — Sep 2019",
  location: "Shanghai",
)[
  - I conducted the overall architecture design for this start-up, including technology selection, deployment strategy, and the framework implementation. I set up the CI/CD pipeline based on cloud platform and participated in engineer recruitment as well.
]\


#entry(
  logo: "resources/Refinitiv.png",
  institution: "LabCI Limited",
  date: "Jan 2018 — Apr 2019",
  title: "Development Manager",
  location: "Hong Kong",
)[]
#entry(
  date: "Sep 2010 — Dec 2017",
  title: "System Analyst",
  location: "Hong Kong",
)[
  Refinitiv, formerly known as Thomson Reuters, is a global financial market data provider. LabCI is a Refinitiv solution vendor serving the Asia market, providing value-added services based on Refinitiv market data.

  One of Refinitiv’s core services is #text(fill: blue)[Alert Services Gateway], which monitors the real-time market movements and notifies customers when pre-defined alert conditions hit. As the technical owner, I was in charge of the full Software Development Life Cycle (SDLC) from business requirement analysis, architecture design, to implementation, client-specific customization, and maintenance. Being able to process huge data in a burst in extreme market conditions with low latency and high availability, the system made a tremendous success. Many multinational banks and large-scale brokerage firms are using it. (Team size = 4)

  Meanwhile, I was accountable for another product – #text(fill: blue)[Visualized Technical Analysis]. It calculates around 80 different technical indicators of securities, varying from widely used Moving Average, MACD to relatively rarely seen Ichimoku (一目均衡表), Point and Figure, and visualizes the indicators on candlestick charts. The main target users are Financial Advisors in investment banks and stock brokerage firms. (Team size = 3)

  Aside from the two products mentioned above, I engaged in various projects:

  --- Standard Chartered Bank Online FX Trading System

  --- JP Morgan Chase Equity Alert System

  --- HSBC Market Data System

  --- HSBC Wealth Product Catalog
]\


#entry(
  date: "Feb 2007 — Sep 2010",
  logo: "resources/TataConsultancyServices.png",
  institution: "TATA Consultancy Services",
  title: "Project Manager",
  location: "Shanghai & Hong Kong",
)[
  TCS is an Indian IT services and consulting company, headquartered in Mumbai, India. As of Feb 2021 TCS was the largest company in the IT sector in the world by Market capitalization.

  I was once the youngest project manager in TCS China. My duties included proposal writing (presales), technical interview (recruitment), system design, and project management. I led several projects to successful delivery. They are:

    --- Huawei Device Web Portal (Team size = 10)

    --- The Hartford Exchange Rate / Interest Rate Management System (Team size = 15)

    --- B&Q eVBA 2007 System (Team size = 2)
\  Apart from the above projects, I also participated in the following projects as a developer:

  --- JP Morgan Chase TSS LVB

  --- Cigna Sales Illustration System

  --- CSL New World Mobility NGNWeb System
]\


#entry(
  date: "Dec 2005 — Dec 2006",
  institution: "MphasiS Limited",
  title: "Software Engineer",
  location: "Shanghai",
)[]\


#entry(
  date: "Jul 2004 — Jul 2005",
  institution: "Shanghai Fudansoft System Engineering Co., Ltd.",
  title: "Software Engineer",
  location: "Shanghai",
)[]\


= Education

#entry(
  date: "Sep 1999 - Jul 2004",
  logo: box(image("resources/UnivSciTechChina.png", height: 1.2cm)),
  title: "B.E. in Information Security",
  institution: "University of Science and Technology of China",
)[]
