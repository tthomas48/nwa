class CompaniesController < ApplicationController
  before_filter :authenticate_admin!,
    :only => [:list, :edit]


  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.where('hide is null or hide = 0')
    @feed_items = FeedItem.order('published desc').limit(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/list
  # GET /companies/list.json
  def list
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end


  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
    @feed_items = FeedItem.where('company_id = ?', @company.id).order('published desc').limit(5)


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html
      format.json { render json: @company }
    end
  end


  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @company }
    end
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        flash[:notice] = 'User was successfully updated.'
        if params[:company][:crop] == "true"
          format.html { redirect_to(@company) }
          format.json { head :ok }
        elsif !params[:company][:logo].blank?
          format.html { render action: 'cropping' }
        else
          format.html { redirect_to list_companies_url }
          format.json { head :ok }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :ok }
    end
  end
end
