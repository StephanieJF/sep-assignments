include RSpec

require_relative 'graph'
require_relative 'node'

RSpec.describe Graph, type: Class do

	let(:kevin_bacon) { Node.new('Kevin Bacon') }
	let(:james_mcavoy) { Node.new('James McAvoy') }
	let(:michael_fassbender) { Node.new('Michael Fassbender') }
	let(:jennifer_lawrence) { Node.new('Jennifer Lawrence') }
	let(:steve_carell) { Node.new('Steve Carell') }
	let(:ryan_gosling) { Node.new('Ryan Gosling') }
	let(:emma_stone) { Node.new('Emma Stone') }
	let(:morgan_freeman) { Node.new('Morgan Freeman') }
	let(:chris_pratt) { Node.new('Chris Pratt') }
	let(:harrison_ford) { Node.new('Harrison Ford') }
	let(:tommy_lee_jones) { Node.new('Tommy Lee Jones') }
	let(:zoe_saldana) { Node.new('Zoe Saldana') }
	let(:bradley_cooper) { Node.new('Bradley Cooper') }
	let(:chris_pine) { Node.new('Chris Pine') }
	let(:simon_pegg) { Node.new('Simon Pegg') }
	let(:tom_cruise) { Node.new('Tom Cruise') }
	let(:jeremy_renner) { Node.new('Jeremy Renner') }
	let(:amy_adams) { Node.new('Amy Adams') }

	let(:graph) { Graph.new }

	before do
	kevin_bacon.film_actor_hash['X-Men: First Class'] = [james_mcavoy, michael_fassbender, jennifer_lawrence]
	james_mcavoy.film_actor_hash['X-Men: First Class'] = [kevin_bacon, michael_fassbender, jennifer_lawrence]
	michael_fassbender.film_actor_hash['X-Men: First Class'] = [james_mcavoy, kevin_bacon, jennifer_lawrence]
	jennifer_lawrence.film_actor_hash['X-Men: First Class'] = [james_mcavoy, michael_fassbender, kevin_bacon]

	james_mcavoy.film_actor_hash['Wanted'] = [morgan_freeman, chris_pratt]
	morgan_freeman.film_actor_hash['Wanted'] = [james_mcavoy, chris_pratt]
	chris_pratt.film_actor_hash['Wanted'] = [morgan_freeman, james_mcavoy]

	harrison_ford.film_actor_hash['The Fugitive'] = [tommy_lee_jones]
	tommy_lee_jones.film_actor_hash['The Fugitive'] = [harrison_ford]

	ryan_gosling.film_actor_hash['Blade Runner: 2049'] = [harrison_ford]
	harrison_ford.film_actor_hash['Blade Runner: 2049'] =[ryan_gosling]

	kevin_bacon.film_actor_hash['Crazy, Stupid, Love'] = [ryan_gosling, emma_stone]
	ryan_gosling.film_actor_hash['Crazy, Stupid, Love'] = [kevin_bacon, emma_stone]
	emma_stone.film_actor_hash['Crazy, Stupid, Love'] = [ryan_gosling, kevin_bacon]

	chris_pratt.film_actor_hash['Guardians of the Galaxy'] = [zoe_saldana, bradley_cooper]
	zoe_saldana.film_actor_hash['Guardians of the Galaxy'] = [chris_pratt, bradley_cooper]
	bradley_cooper.film_actor_hash['Guardians of the Galaxy'] = [zoe_saldana, chris_pratt]

	simon_pegg.film_actor_hash['Mission Impossible: Ghost Protocol'] = [tom_cruise, jeremy_renner]
	tom_cruise.film_actor_hash['Mission Impossible: Ghost Protocol'] = [simon_pegg, jeremy_renner]
	jeremy_renner.film_actor_hash['Mission Impossible: Ghost Protocol'] = [simon_pegg, tom_cruise]

	zoe_saldana.film_actor_hash['Star Trek: Into Darkness'] = [chris_pine, simon_pegg]
	chris_pine.film_actor_hash['Star Trek: Into Darkness'] = [zoe_saldana, simon_pegg]
	simon_pegg.film_actor_hash['Star Trek: Into Darkness'] = [chris_pine, zoe_saldana]

	jeremy_renner.film_actor_hash['Arrival'] = [amy_adams]
	amy_adams.film_actor_hash['Arrival'] = [jeremy_renner]
	end

	describe "find degrees of kevin bacon" do
		it "returns a movie with a direct connection to kevin bacon" do
			expect(graph.find_kevin_bacon(michael_fassbender)).to eq ['X-Men: First Class']
		end

		it "returns a list of movies connected kevin bacon if there is no direct connection" do
			expect(graph.find_kevin_bacon(ryan_gosling)).to eq ['Blade Runner: 2049', 'Crazy, Stupid, Love']
		end
	end
end
