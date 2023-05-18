Program vec_obj;
{$APPTYPE CONSOLE}

uses
    SysUtils, Math;

type
    vec3 = object
		private
			x,y,z : real;
      length : real;
    public
       constructor create(ax, ay, az : real);
       function calc_length() : real;

    end;

    constructor Vec3.create(ax: Real; ay: Real; az: Real);
    begin
      x:=ax;
      y:=ay;
      z:=az;
      length:=calc_length();
    end;

    function Vec3.calc_length(): real;
    begin
      result := sqrt(x*x + y*y +z*z);
    end;



    type
    Container = object
    private
      data : array of Vec3;

    public
    constructor create_random(size:integer);
    procedure print_all_vectors();
    procedure add_vector(arg_r : Vec3);
    function find_shortest_vector() : Vec3;
    end;

    constructor Container.create_random(size:integer);
    var i : integer;
    begin
      SetLength(data, size);
      for i := 0 to size - 1 do
        data[i] := Vec3.create(random, random, random);
    end;

    procedure Container.print_all_vectors();
     var
      i:integer;
     begin
        for i:=0 to Length(data) - 1 do
        write('(',data[i].x:0:2,',',data[i].y:0:2,',',data[i].z:0:2,'),');
     end;

    procedure Container.add_vector(v : Vec3);
     begin
      SetLength(data,Length(data) + 1);
      data[Length(data) - 1] := v;
      end;

      function Container.find_shortest_vector() : Vec3;
      var
        i : integer;
        shortest : real;
        shortestVec : Vec3;
      begin
        shortest := data[0].length;
        shortestVec := data[0];
        for i := 1 to Length(data) - 1 do
        begin
          shortest := data[i].length;
          shortestVec := data[i];
          
      end;
end;

var
	a,b,c : vec3;
Begin
    a.create(1,2,3);
	a.print_value;

    b.create(1,1,10);
	b.print_value;

	c := b.sum(a);
	c.print_value;

	writeln(a.dot_product(b):0:3);

	writeln('OK!');
  readln;
End.
