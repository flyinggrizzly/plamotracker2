module FactTable
  module KitLines
    extend(self)
    extend(Table)

    DEPENDENCIES = [
      Producers
    ].freeze

    DATA = [
      { name: "Non-grade",                      nickname: "Non-grade",       slug: "non_grade",  producer_name: "Bandai"},
      { name: "High Grade",                     nickname: "HG",              slug: "hg",         producer_name: "Bandai"},
      { name: "High Grade Universal Century",   nickname: "HGUC",            slug: "hguc",       producer_name: "Bandai"},
      { name: "High Grade After Colony",        nickname: "HGAC",            slug: "hgac",       producer_name: "Bandai"},
      { name: "High Grade Build Divers",        nickname: "HGBD",            slug: "hgbd",       producer_name: "Bandai"},
      { name: "Real Grade",                     nickname: "RG",              slug: "rg",         producer_name: "Bandai"},
      { name: "Master Grade",                   nickname: "MG",              slug: "mg",         producer_name: "Bandai"},
      { name: "RE/100",                         nickname: "RE/100",          slug: "re_100",     producer_name: "Bandai"},
      { name: "Full Mechanics",                 nickname: "Full Mechanics",  slug: "fm_100",     producer_name: "Bandai"},
      { name: "Perfect Grade",                  nickname: "PG",              slug: "pg",         producer_name: "Bandai"},
      { name: "Super Deformed",                 nickname: "SD",              slug: "sd",         producer_name: "Bandai"},
      { name: "SD Cross Silhouette",            nickname: "SDCS",            slug: "sdcs",       producer_name: "Bandai"},
      { name: "SD EX-Standard",                 nickname: "SDEX",            slug: "sdex",       producer_name: "Bandai"},
      { name: "EX Model",                       nickname: "EX Model",        slug: "ex_model",   producer_name: "Bandai"},
      { name: "UC Hard Graph",                  nickname: "UC Hard Graph",   slug: "hard_graph", producer_name: "Bandai"},
      { name: "Gundam Artifact",                nickname: "Gundam Artifact", slug: "artifact",   producer_name: "Bandai"},
      { name: "Moving Model",                   nickname: "MM",              slug: "mm",         producer_name: "Volks"},
      { name: "Volks Injection Molding System", nickname: "IMS",             slug: "ims",        producer_name: "Volks"},
      { name: "MG ver. KA",                     nickname: "MG ver. KA",      slug: "mgka",       producer_name: "Bandai"},
      { name: "P-Bandai",                       nickname: "Peebles",         slug: "p_bandai",   producer_name: "Bandai"},
      { name: "B-Club",                         nickname: "B-Club",          slug: "b_club",     producer_name: "Bandai"},
      { name: "Moderoid",                       nickname: "Moderoid",        slug: "moderoid",   producer_name: "Good Smile Company" },
      { name: "Plamax",                         nickname: "Plamax",          slug: "plamax",     producer_name: "MAX Factory" },
      { name: "High Grade Iron Blood Orphans",  nickname: "HGIBO",           slug: "hgibo",      producer_name: "Bandai" },
    ].freeze

    def build(producers = Producers.build)
      DATA.map do |kl|
        kl => {
          producer_name:,
          name:,
          nickname:,
          slug:
        }

        producer = producers.fetch(producer_name)

        raise "Cannot find producer for producer name #{producer_name}" unless producer.present?

        [name, KitLine.find_or_initialize_by(name:, nickname:, slug:, producer:)]
      end
        .to_h
    end
  end
end
