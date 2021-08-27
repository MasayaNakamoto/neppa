require 'rails_helper'

describe '会員の登録〜注文のテスト' do
  context 'トップページのテスト' do
    let!(:customer) { create(:customer) }

    it '会員登録画面へのリンクを押すと新規登録画面が表示される' do
      visit root_path
      click_link '会員登録'
      expect(current_path).to eq new_customer_registration_path
    end
  end

  describe '会員登録画面のテスト' do
    before do
      visit new_customer_registration_path
      fill_in 'customer[last_name]', with: "サウナ"
      fill_in 'customer[first_name]', with: "大好き"
      fill_in 'customer[last_name_kana]', with: "サウナ"
      fill_in 'customer[first_name_kana]', with: "ダイスキ"
      fill_in 'customer[email]', with: "sample@example.com"
      fill_in 'customer[phone_number]', with: "00000000000"
      fill_in 'customer[password]', with: "password"
      fill_in 'customer[password_confirmation]', with: "password"
      click_button "新規登録"
    end

    context '会員登録画面のテスト' do
      it '必要事項を入力して登録ボタンを押下するとマイページに遷移する' do
        expect(current_path).to eq customer_path
      end

      it '会員登録画面で入力した情報が表示されている' do
        expect(page).to have_content 'サウナ'
        expect(page).to have_content '大好き'
        expect(page).to have_content 'サウナ'
        expect(page).to have_content 'ダイスキ'
        expect(page).to have_content 'sample@example.com'
        expect(page).to have_content '00000000000'
      end

      it 'ヘッダーがログイン後の表示に変わっている' do
        expect(page).to have_link 'マイページ'
        expect(page).to have_link '店舗一覧'
        expect(page).to have_link '商品一覧'
        expect(page).to have_link '商品カート'
        expect(page).to have_link 'ログアウト'
      end
    end

    context 'ヘッダーロゴのテスト' do
    it 'ヘッダーロゴを押すとトップ画面に遷移する' do
        click_on()
        expect(current_path).to eq root_path
      end
    end

    context 'トップ画面のテスト' do
      let!(:item_1) { create(:item) }
      let!(:item_2) { create(:item) }

      it '商品画像を押すと該当商品の詳細画面に遷移する' do
        visit items_path
        find('a[href="/items/1"]').click
        expect(current_path).to eq item_path(1)
      end

      it '押した商品の情報が正しく表示されている' do
        visit item_path(1)
        expect(page).to have_content item_1.name
        expect(page).to have_content item_1.image
        expect(page).to have_content item_1.add_tax_price
      end
    end

    context '商品詳細画面のテスト' do
      let!(:item) { create(:item) }

      before do
        visit item_path(1)
        find("option[value='1']").select_option
        click_button 'カートに入れる'
      end

      it '個数を選択し、カートに入れるボタンを押すと、カート画面に遷移する' do
        expect(current_path).to eq cart_items_path
      end

      it 'カートの中身が正しく表示されている' do
        visit cart_items_path
        expect(page).to have_content item.name
        expect(page).to have_content item.add_tax_price
        expect(page).to have_selector ("input[value='1']")
        expect(page).to have_content item.add_tax_price
      end
    end

    context 'カート画面のテスト' do
      let!(:item) { create(:item) }
      let!(:cart_item) { create(:cart_item) }

      before do
        visit cart_items_path
      end

      it '買い物を続けるボタンを押すと商品一覧画面に遷移する' do
        click_link '買い物続ける'
        expect(current_path).to eq items_path
      end

      it '商品の個数を変更し、更新ボタンを押すと合計表示が正しく表示される' do
        fill_in 'cart_item[amount]', with: '3'
        click_button '変更'
        expect(page).to have_content (item.price * 1.1) * 3
      end

      it '情報入力に進むボタンを押すと情報入力画面に遷移する' do
        click_link '情報入力を続ける'
        expect(current_path).to eq  new_order_path
      end
    end

    context '注文情報入力画面のテスト' do
      let!(:customer) { create(:customer) }
      let!(:item) { create(:item) }
      let!(:cart_item) { create(:cart_item) }

      before do
        visit new_order_path
      end

      it '支払い方法の選択,住所の記入をし、確認画面へ進むボタンを押すと注文確認画面に遷移する' do #要確認
        choose 'order_payment_method_1'
        choose 'order_address_select_2'
        fill_in 'order[postal_code]', with: '1111111'
        fill_in 'order[address]', with: '東京都渋谷区'
        fill_in 'order[name]', with: '渋谷二郎'
        click_button '確認画面へ'
        expect(current_path).to eq orders_confirm_path
      end
    end

    context '注文確認画面のテスト' do
      let!(:item) { create(:item) }
      let!(:cart_item) { create(:cart_item) }

      before do
        visit new_order_path
        choose 'order_payment_method_1'
        choose 'order_address_select_2'
        fill_in 'order[postal_code]', with: '1111111'
        fill_in 'order[address]', with: '東京都渋谷区'
        fill_in 'order[name]', with: '渋谷二郎'
        click_button '確認画面へ'
      end

     it '選択した商品、合計金額、配送方法などが表示されている' do
        expect(page).to have_content item.name
        expect(page).to have_content ((item.price * 1.1) * cart_item.amount + 500).to_s(:delimited)
         expect(page).to have_content '銀行振込'
      end

      # it '確定ボタンを押すとサンクスページに遷移する' do
      #   click_button '注文を確定する'
      #   expect(current_path).to eq complete_path
      # end
    end

    # context 'サンクスページのテスト' do
    #   it 'ヘッダーのマイページへのリンクを押すとマイページに遷移する' do
    #     visit orders_complete_path
    #     click_link 'マイページ'
    #     expect(current_path).to eq customer_path
    #   end
    # end

    context 'マイページのテスト' do
      it '注文履歴の一覧のリンクを押すと注文履歴一覧画面へ遷移する' do
        visit customer_path
        find('a[href="/orders"]').click
        expect(current_path).to eq orders_path
      end
    end

    context '注文履歴一覧画面のテスト' do
      let!(:item) { create(:item) }
      let!(:cart_item) { create(:cart_item) }
      let!(:order) { create(:order) }

      before do
        visit orders_path
      end

      it '注文した商品の詳細表示ボタンを押すと注文詳細が表示される' do
        click_link "表示"
        expect(current_path).to eq order_path(1)
      end
    end

    context '注文詳細画面のテスト' do
      let!(:item) { create(:item) }
      let!(:cart_item) { create(:cart_item) }
      let!(:order) { create(:order) }

      before do
        visit order_path(1)
      end

      # it '注文内容が正しく表示されている' do
      #   expect(page).to have_content order.created_at
      #   expect(page).to have_content order.address
      #   expect(page).to have_content order.total_price
      #   expect(page).to have_content '銀行振込'
      # end

      # it 'ステータスが「入金待ち」になっている' do
      #   expect(page).to have_content '入金待ち'
      # end
    end
  end
end