class AtividadesController < ApplicationController

  before_filter :authenticate_usuario!

  # GET /atividades
  # GET /atividades.json
  def index
    @atividades = Atividade.all :conditions => {:usuario_id => current_usuario.id}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @atividades }
    end
  end

  # GET /atividades/1
  # GET /atividades/1.json
  def show
    @atividade = Atividade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atividade }
    end
  end

  # GET /atividades/new
  # GET /atividades/new.json
  def new
    @atividade = Atividade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atividade }
    end
  end

  # GET /atividades/1/edit
  def edit
    @atividade = Atividade.find(params[:id])
  end

  # POST /atividades
  # POST /atividades.json
  def create
    @atividade = Atividade.new(params[:atividade])
    @atividade.usuario_id = current_usuario.id rescue nil

    respond_to do |format|
      if @atividade.save
        format.html { redirect_to @atividade, notice: 'Atividade criada com sucesso.' }
        format.json { render json: @atividade, status: :created, location: @atividade }
      else
        format.html {
          flash.now[:error] = @atividade.errors
          render action: "new"
        }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /atividades/1
  # PUT /atividades/1.json
  def update
    @atividade = Atividade.find(params[:id])

    respond_to do |format|
      if @atividade.update_attributes(params[:atividade])
        format.html { redirect_to @atividade, notice: 'Atividade atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html {
          flash.now[:error] = @atividade.errors
          render action: "edit"
        }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atividades/1
  # DELETE /atividades/1.json
  def destroy
    @atividade = Atividade.find(params[:id])
    @atividade.destroy

    respond_to do |format|
      format.html { redirect_to atividades_url }
      format.json { head :no_content }
    end
  end
end
