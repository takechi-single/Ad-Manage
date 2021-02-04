require 'rails_helper'

RSpec.describe Manage, type: :model do
  before do
    @manage = FactoryBot.build(:manage)
  end

  describe '商材登録情報の入力' do 
    it 'すべての値が正しく入力できれば出品できること' do
      @manage.valid?
      expect(@manage).to be_valid
    end

    it '売上日を選択しなければ出品できないこと' do
      @manage.sale_date = nil
      @manage.valid?
      expect(@manage.errors.full_messages).to include("Sale date can't be blank")
    end

    it '売上を入力しなければ登録できないこと' do
      @manage.profit = nil
      @manage.valid?
      expect(@manage.errors.full_messages).to include("Profit can't be blank")
    end

    it '売上は全角数字だと登録できないこと' do
      @manage.profit = '７００'
      @manage.valid?
      expect(@manage.errors.full_messages).to include("Profit is invalid. Input half-width characters.")
    end
  end
end
