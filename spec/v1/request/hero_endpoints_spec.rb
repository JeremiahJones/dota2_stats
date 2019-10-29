describe Dota2Stats::V1::Client do
  describe 'endpoints for heroes' do
    let(:response) do
      double(
        body: body,
        ok?: ok,
        status: status,
        content_type: 'application/json',
        headers: headers
      )
    end
    let(:body) { '' }
    let(:ok) { true }
    let(:status) { 200 }
    let(:headers) { {} }

    before { allow(subject.http_client).to receive(:get).and_return(response) }

    context '#get_heroes' do
      let(:body) { load_fixture('heroes.json') }
      let(:endpoint_url) { "#{Dota2Stats.config.base_url}/IEconDOTA2_570/GetHeroes/v1?key=steamy_api_key_goes_here" }

      before { allow(subject.http_client).to receive(:get).and_return(response) }

      it 'hits the correct endpoint' do
        expect(subject.http_client).to receive(:get).with(endpoint_url, anything)
        subject.get_heroes
      end

      context 'successful response' do
        it 'returns all the heroes' do
          heroes = subject.get_heroes

          expect(heroes.heroes.count).to eq(117)
        end
      end
    end
  end
end
