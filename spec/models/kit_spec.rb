require 'rails_helper'

RSpec.describe Kit, type: :model do
  let(:scale) { KitScale.create(name: "1/100", denominator: 100) }
  let(:producer) { Producer.create(name: "Bandai") }
  let(:designer) { Designer.create(name: "Okawara Kunio") }
  let(:kit_line) { KitLine.create(name: "MG", slug: "mg", producer:) }
  let(:kit_attrs) {
    {
      name: "Gundam 3.0",
      kit_scale: scale,
      producers: [producer],
      designers: [designer],
      kit_lines: [kit_line]
    }
  }

  describe 'uniqueness' do
    it 'must be unique in the constraint of producers, kit_lines, designers, and scale' do

      Kit.create(**kit_attrs)

      kit = Kit.new(**kit_attrs)

      expect(kit).not_to be_valid
    end
  end

  describe 'kit identifiers' do
    it 'builds identifiers with available attributes do' do
      kit = Kit.new(**kit_attrs)
      kit.validate

      expect(kit.identifier).to eq('name={Gundam 3.0},scale={1/100},designers={["Okawara Kunio"]},producers={["Bandai"]},kit_lines={["mg"]}')

      smaller_attrs = kit_attrs.except(:producers, :designers, :kit_lines)

      kit_2 = Kit.new(**smaller_attrs)
      kit_2.validate

      expect(kit_2.identifier).to eq('name={Gundam 3.0},scale={1/100}')
    end
  end
end
