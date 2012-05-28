
require 'test_helper'


class DepenseTest < ActiveSupport::TestCase

	depense = Depense.new
	assert depense.invalid?
	assert depense.errors[:user_id].any?
	assert depense.errors[:destinataire_id].any?
	assert depense.errors[:montant].any?
	assert depense.errors[:raison].any?

end

