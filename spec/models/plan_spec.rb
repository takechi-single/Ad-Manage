require 'rails_helper'

RSpec.describe Plan, type: :model do
  before do
    @plan = FactoryBot.build(:plan)
  end

  describe '商材登録情報の入力' do 
    it 'すべての値が正しく入力できれば出品できること' do
      @plan.valid?
      expect(@plan).to be_valid
    end

    it '広告出稿日を選択しなければ出品できないこと' do
      @plan.out_date = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Out date can't be blank")
    end

    it '出稿場所を入力しなければ出品できないこと' do
      @plan.where = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Where can't be blank")
    end

    it 'ターゲット層を選択しなければ出品できないこと' do
      @plan.target_id = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Target can't be blank")
    end

    it 'ターゲット層は「"---"」を選択すると出品できないこと' do
      @plan.target_id = 0
      @plan.valid?
      expect(@plan.errors.full_messages).to include('Target must be other than 0')
    end

    it '広告媒体を選択しなければ出品できないこと' do
      @plan.media_id = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Media can't be blank")
    end

    it '広告媒体は「"---"」を選択すると出品できないこと' do
      @plan.media_id = "---"
      @plan.valid?
      expect(@plan.errors.full_messages).to include('Media must be other than 0')
    end

    it '広告費用を入力しなければ登録できないこと' do
      @plan.how_much = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("How much can't be blank")
    end

    it '広告費用は全角数字だと登録できないこと' do
      @plan.how_much = '７００'
      @plan.valid?
      expect(@plan.errors.full_messages).to include("How much is invalid. Input half-width characters.")
    end
  end
end
