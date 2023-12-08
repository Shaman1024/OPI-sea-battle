program Battleship;

uses
  SysUtils;

type
  TMATRIX = array [1 .. 10, 1 .. 10] of string;
  TMASSTR = array [1 .. 20] of string;

var
  field1, field2, field1_with_boats, field2_with_boats: TMATRIX;
  letters: TMASSTR;
  i, j, index1, index2: integer;
  letter: char;
  shot: string;
  flag1, flag2, flag, repeatshot: boolean;


procedure outputMAS(var MAS: TMATRIX);
var
  nomerstr, i, j: integer;
  nomerstolb: char;
begin
  nomerstolb := '�';
  write('    ');
  for i := 1 to 10 do
  begin
    if nomerstolb = '�' then
    begin
      nomerstolb := '�';
      write(nomerstolb:3, ' ');
    end
    else
    begin
      write(nomerstolb:3, ' ');
      nomerstolb := Chr(Ord(nomerstolb) + 1);
    end;
  end;
  writeln;
  write('    -');
  for i := 1 to 10 do
  begin
    write('----');
  end;
  writeln;
  nomerstr := 1;
  for i := 1 to 10 do
  begin
    write(nomerstr:3, ' |');
    for j := 1 to 10 do
    begin
      write(MAS[i, j]:2, ' |');
    end;
    inc(nomerstr);
    writeln;
    writeln('   ------------------------------------------');
  end;
  writeln;
end;

procedure show_war(var field, field_with_boats: TMATRIX; var onemoreshot: boolean);
var
  letter: char;
  shot: string;
  flag1, flag2: boolean;
  i, j, index1, index2: integer;
begin
  writeln('������� ���������� �������� : (������  �-1)');
  readln(shot);
  flag1 := true;
  flag2 := true;
  repeatshot := false;
  index1 := 0;
  index2 := 0;
  for i := 1 to length(shot) do
  begin
    for j := 1 to 20 do
    begin
      if (shot[i] = letters[j]) then
      begin
        if flag1 then
        begin
          index1 := j;
          flag1 := false;
        end
        else if flag2 then
        begin
          if (shot[length(shot)] = '0') and (j = 11) then
          begin
            index2 := 10;
            flag2 := false;
          end
          else if j = 11 then
          begin
            index2 := 1;
            flag2 := false;
          end
          else
          begin
            index2 := j - 10;
            flag2 := false;
          end;
        end;
      end;
    end;
  end;
  //writeln(index1, ' ', index2);
  if (field_with_boats[index2, index1] <> '�') and (field_with_boats[index2, index1] <> 'X') then
  begin
    field[index2, index1] := '*';
    field_with_boats[index2, index1] := '*';
    writeln('��� ��������� ������ ������');
  end
  else
  begin
    if field_with_boats[index2, index1] = 'X' then
    begin
      onemoreshot := false;
      writeln('��� ��������� ������ ������');
    end
    else
    begin
      field[index2, index1] := 'X';
      field_with_boats[index2, index1] := 'X';
      onemoreshot := true;
      writeln('�� ��������� ��� ���');
    end;
  end;
end;

begin
  letter := '�';
  for i := 1 to 10 do
  begin
    if letter = '�' then
    begin
      letter := '�';
    end;
    letters[i] := letter;
    letter := Chr(Ord(letter) + 1);
  end;

  letter := '1';
  for i := 11 to 20 do
  begin
    if letter = ':' then
    begin
      letters[i] := '10';
    end
    else
    begin
      letters[i] := letter;
      letter := Chr(Ord(letter) + 1);
    end;
  end;
  writeln('������� �������� : ');
  writeln('���� - ������� ���');
  writeln('1. ������� ���������� ��������(����� �������� �� ������� �����');
  writeln('2. ��������� ������������� ���� �� ������ �� ��������� �������(X), ���� �� ������(*) ');
  writeln('3. ���� ������������ �� ���� �������, ���� �� ����� ���������� ��� ���������(����) �������');
  writeln('�������� ����!');
  flag := true;
  repeatshot := true;
  writeln('---------------------------------------------------------------------');
  writeln('������ ����!');
  for i := 1 to 5 do
  begin
    for j := 1 to 5 do
    begin
      field1_with_boats[i, j] := '�';
    end;
  end;
  for i := 5 to 10 do
  begin
    for j := 5 to 10 do
    begin
      field2_with_boats[i, j] := '�';
    end;
  end;
  while flag do
  begin
    writeln('��� ������ ����� 1');
    writeln('���� ����������');
    repeatshot := true;
    while repeatshot do
    begin
      show_war(field2,field2_with_boats, repeatshot);
      outputMAS(field2);
      //outputMAS(field2_with_boats);
    end;
    writeln('��� ������ ����� 2');
    writeln('���� ����������');
    repeatshot := true;
    while repeatshot do
    begin
      show_war(field1,field1_with_boats, repeatshot);
      outputMAS(field1);
      //outputMAS(field1_with_boats);
    end;
  end;
  readln;

end.
