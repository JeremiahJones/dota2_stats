describe Dota2Stats::V1::Response::Heroes do
  let(:response) { load_fixture('heroes.json') }

  subject { described_class.from_json(response).heroes.first }

  it { expect(subject.id).to eq(1) }

  it { expect(subject.name).to eq('npc_dota_hero_antimage') }
end
