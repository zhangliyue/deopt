class PeopleController < ApplicationController
  @@current_person=[]
  @@current_room=[]
  # GET /people
  # GET /people.json
  def index
   @people=[]
    people = Person.all
    people.each do |people|
    @people<<people  if people.people_zhuangtai=="yi zhu"
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new
    room=Room.find(params[:id])
    @@current_room<<room

    respond_to do |format|
      format.html
    end
  end
  def new_people
    @person = Person.new
     person = Person.find(params[:person_id])
    @@current_person<<person

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    r=[]
    @person = Person.new(params[:person])
    unless @@current_person.empty?
    person=@@current_person[0]
    @person.age=person.age
    @person.name=person.name
    @person.sex=person.sex
    @person.address=person.address
    @person.people_zhuangtai="yi zhu"
    @person.save
    end
    unless @@current_room.empty?
     @room=@@current_room[0]
     @person.room=@room.number
     @person.save
     
    end
    @person.people_zhuangtai="yi zhu"
    @person.save
    @room=Room.all
    @room.each do |room|
    room.num += 1  if room.number==@person.room 
    r<<room  if room.number==@person.room
    room.zhuangtai="yi kai" if room.number==@person.room
    room.update_attributes(params[:room])
    end

    respond_to do |format|
      if @person.save
        unless @@current_person.empty?
        @@current_person.delete_at(0)
        end
        unless @@current_room.empty?
        @@current_room.delete_at(0)
        end
        format.html { redirect_to chakan_rooms_path(:room_id=>r[0]), notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])
    room= Room.find(@person.room)
    room.num-=1
    room.zhuangtai="kong fang"  if room.num==0
    room.update_attributes(params[:room])
    @person.update_attributes(params[:person])
    @room= Room.find(@person.room)
      @room.zhuangtai="yi kai"  
      @room.num+=1  
    @room.update_attributes(params[:room])
    

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to chakan_rooms_path(:room_id=>@room), notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.people_zhuangtai="yi tui"
    @person.update_attributes(params[:person])
    
    @room=Room.find(@person.room)
    @room.num-=1 if @room.num>0
    @room.update_attributes(params[:room])
    
    respond_to do |format|
      if @room.num==0
    @room.zhuangtai="kong fang"    
    @room.update_attributes(params[:room])
      format.html { redirect_to rooms_url}
    else 
      format.html { redirect_to chakan_rooms_path(:room_id=>@room)}
      format.json { head :no_content }
    end
  end
end
end
