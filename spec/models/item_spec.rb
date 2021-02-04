require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商材登録情報の入力' do 
    it 'すべての値が正しく入力できれば登録できること' do
      @item.valid?
      expect(@item).to be_valid
    end

    it '商材画像を選択しなければ登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商材名を入力しなければ登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商材の概要を入力しなければ登録できないこと' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it '小売希望価格を入力しなければ登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '小売希望価格は全角数字だと出品できないこと' do
      @item.price = '７００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
    end

    it '商材の発売日を選択しなければ登録できないこと' do
      @item.relese_date = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Relese date can't be blank")
    end
  end
end
