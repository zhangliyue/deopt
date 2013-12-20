class RoomsController < ApplicationController

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms=Room.all
    respond_to  do   |format|
     format.html
   end
  end
  # GET /rooms/1
  # GET /rooms/1.json
  def chakan
    @room=Room.find(params[:room_id])
    @p=[]
    @time=Time.now
    @person= Person.all
    @person.each do |person|
       if @room.number==person.room
          if person.people_zhuangtai=="yi zhu"
              @p<<person
           end
      end
    end
    respond_to do |format|
     if  @room.zhuangtai=="yi kai"
      format.html # show.html.erb
      format.xml {render :xml => @room.to_xml }# show.html.erb
      format.json { render json: @room }
     else
      format.html { redirect_to rooms_url }
    end
  end
end

  # GET /rooms/new
  # GET /rooms/new.json
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])

    respond_to do |format|
      format.js
   end
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(params[:room])

    respond_to do |format|
      if @room.save
        format.html { redirect_to chakan_rooms_path @room, notice: 'Room was successfully created.' }
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render action: "new" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to rooms_url, notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room =Room.find(params[:id]) 
    @person= Person.all
    @person.each do |person|
    person.people_zhuangtai="yi tui"   if @room.number==person.room
    person.update_attributes(params[:person])
    end
    @room.zhuangtai="kong fang"
    @room.num=0
    @room.update_attributes(params[:room])

    respond_to do |format|
      
      format.html { redirect_to rooms_url}
      format.json { render json: @rooms }
  end
  end

  def old_people
    @people=[]
    persons=Person.all
    persons.each do |person|
    @people<<person if person.people_zhuangtai=="yi tui"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end
end
