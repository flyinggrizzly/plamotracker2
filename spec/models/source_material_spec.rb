require 'rails_helper'

RSpec.describe SourceMaterial, type: :model do
  let(:source_material) { SourceMaterial.create(name: 'Root', base_slug: 'root') }

  describe "slug setting" do
    describe "with a parent source" do
      let(:child) { SourceMaterial.create(name: 'Child', base_slug: 'child', parent_source: source_material)  }

      it 'sets the slug on creation' do
        expect(child.slug).to eq('root/child')
      end

      it 'notifies children to update their slugs after changing' do
        source_material.update(base_slug: 'changed')

        expect(child.reload.slug).to eq('changed/child')
      end
    end

    describe "without a parent source" do

      it 'sets the slug on creation' do
        expect(source_material.slug).to eq('root')
      end

      it 'updates the slug when the base_slug changes' do
        source_material.update(base_slug: 'changed_apex')

        expect(source_material.slug).to eq('changed_apex')
      end
    end
  end

  describe '#depth' do
    context 'when a root source material' do
      it 'returns 0' do
        expect(source_material.depth).to eq(0)
      end
    end

    context 'when nested' do
      it 'returns the appropriate number' do
        child = source_material.sub_sources.create(name: 'Child', base_slug: 'child')

        expect(child.depth).to eq(1)

        grandchild = child.sub_sources.create(name: 'Grandchild', base_slug: 'grandchild')

        expect(grandchild.depth).to eq(2)
      end
    end
  end
end
