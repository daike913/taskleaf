# require 'rails_helper'
#
# describe 'タスク管理機能', type: :system do
#   context '一覧管理機能' do
#     let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
#     let(:task) { FactoryBot.create(:task, name: '最初のタスク', user: user_a) }
#     context 'ユーザーがログインしている時' do
#       before do
#
#         # binding.pry
#         # user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
#
#         visit login_path
#         fill_in 'メールアドレス', with: 'a@example.com'
#         fill_in 'パスワード', with: 'password'
#         click_button 'ログインする'
#       end
#
#
#       it 'ユーザーが作成したタスクが表示される' do
#         expect(page).to have_content '最初のタスク'
#       end
#     end
#   end
# end

require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
    end

    context 'ユーザAがログインしている時' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザAが作成したタスクが表示される' do
        expect(page).to have_content '最初のタスク'
      end
    end

    context 'ユーザBがログインしている時' do
      before do
        FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')
        visit login_path
        fill_in 'メールアドレス', with: 'b@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it "ユーザAが作成したタスクが表示されない" do
        expect(page).to have_no_content '最初のタスク'
      end
    end
  end
end
