# Entriesテーブルの操作を全て受け持つコントローラ
class EntriesController < ApplicationController
  # レコードが指定されたアクションの場合は、まずそのレコードをロードする必要があるので、共通処理としてアクションの前にレコードのロード処理を行う。
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    # 表示するレコードをロードする。
    @entries = Entry.all
    # renderが書かれていないが、書いていない場合のデフォルトはアクション名と同じ。今回はindex。以下同様。
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    # 指定されたレコードを表示するが、レコードのロードはbefore_actionで指定したset_entryで行なっているため、その他に必要な処理がない。
    # もちろん、必要がある処理は追加する。
  end

  # GET /entries/new
  def new
    # 新規レコードであるため空のオブジェクトを作成しておく。
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
    # showと同じ意味で、処理が書かれていない。
  end

  # POST /entries
  # POST /entries.json
  def create
    # 送信されたデータをEntryオブジェクトに設定している
    @entry = Entry.new(entry_params)

    # 要求されているレスポンスデータのフォーマットの違いにより処理が分かれている。この場合は、htmlからjsonで処理が分かれている。
    respond_to do |format|
      # 保存処理。trueであればバリデーション成功。falseであればバリデーション失敗。
      if @entry.save
        # htmlの場合。成功した場合は、showの画面にリダイレクト。更新処理後はリダイレクトすることが好ましい。noticeで登録後のメッセージを追加している。
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        # jsonの場合。HTTPステータスコードは201となっている。locationは、jsonの中に指定するこのリソースのURL。
        format.json { render :show, status: :created, location: @entry }
      else
        # バリデーションに失敗した場合は、フォームの画面を再表示する。
        format.html { render :new }
        # json形式でエラーの内容を返す。
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      # データベースからロードしたオブジェクトを、送信されたデータで上書きし、DB保存処理を行う。
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    # DBから削除する。
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # 「/entries/1」というようなURLで、どのレコードが対象であるか特定されている場合は、前処理としてそのレコードをロードする。共通処理なのでメソッド化されている。
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # 送信されたデータは「entries: {xxx: xxx, yyy: yyy}」という形式になっているが、まずentriesが存在していることをチェックし、なければエラーが発生する。
    # またpermitで指定されたもののみ許可され、それ以外のデータは無視され、ログにwarningが出力される。
    # セキュリティの問題。
    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:title, :body)
    end
end
