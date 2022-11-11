unit BorlandVCLApplicationForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvMenus, Menus, SynEdit, ComCtrls, ToolWin, ExtCtrls,
  Grids, ATBinHex, ImgList, JvExControls, JvArrowButton, SynHighlighterAsm,
  SynEditHighlighter, SynHighlighterCpp;

type
  TApplicationForm = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Splitter2: TSplitter;
    CoolBar1: TCoolBar;
    Panel3: TPanel;
    Splitter3: TSplitter;
    JvMainMenu1: TJvMainMenu;
    File1: TMenuItem;
    JvOfficeMenuItemPainter1: TJvOfficeMenuItemPainter;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    Close1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    InfoScrollBox: TScrollBox;
    RegisterStringGrid: TStringGrid;
    Edit1: TMenuItem;
    ScrollBox3: TScrollBox;
    StringGrid3: TStringGrid;
    Label11: TLabel;
    StringGrid2: TStringGrid;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    FlagsStringGrid: TStringGrid;
    Label1: TLabel;
    ScrollBox4: TScrollBox;
    TreeView1: TTreeView;
    Label12: TLabel;
    Label13: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label14: TLabel;
    Edit4: TEdit;
    ImageList1: TImageList;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Help1: TMenuItem;
    HelpAbout: TMenuItem;
    N4: TMenuItem;
    OfflineHelp1: TMenuItem;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    JvArrowButton1: TJvArrowButton;
    JvPopupMenu1: TJvPopupMenu;
    JvOfficeMenuItemPainter2: TJvOfficeMenuItemPainter;
    ExecutableInfos1: TMenuItem;
    Assembly1: TMenuItem;
    CCode1: TMenuItem;
    N5: TMenuItem;
    HexViewBuilder1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    PageControl3: TPageControl;
    TabSheet2: TTabSheet;
    SynEdit1: TSynEdit;
    TabSheet4: TTabSheet;
    ATBinHex1: TATBinHex;
    TabSheet5: TTabSheet;
    CPPsourceCode: TSynEdit;
    SynCppSyn1: TSynCppSyn;
    SynAsmSyn1: TSynAsmSyn;
    procedure RegisterStringGridDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ApplicationForm: TApplicationForm;

implementation

{$R *.dfm}

procedure TApplicationForm.RegisterStringGridDrawCell(
  Sender: TObject;
  ACol, ARow: Integer;
  Rect: TRect;
  State: TGridDrawState);
var
  xcell : Integer;
begin
  if ACol = 0 then
  begin
    if ARow in [1,2,4,5,7,8] then
    begin
      with RegisterStringGrid.Canvas do
      begin
        Brush.Color := clBtnFace;
        Font .Color := clBlack;
        TextOut(
        Rect.Left+2,Rect.Top+4,
        RegisterStringGrid.Cells[ACol,ARow]);
      end;
    end;
    exit;
  end;

  if ARow in [0,3,6] then
  begin
    with RegisterStringGrid.Canvas do
    begin
      Brush.Color := clYellow;
      Font .Color := clBlack;
      FillRect(Rect);
      TextOut(
      Rect.Left+2,Rect.Top+4,
      RegisterStringGrid.Cells[ACol,ARow]);
    end;
    exit;
  end else
  if ARow in [1,2,4,5,7,8] then
  begin
    Rect.Right :=
    Rect.Right + RegisterStringGrid.GridLineWidth;

    with RegisterStringGrid.Canvas do
    begin
      Brush.Color := clWhite;
      Font.Color  := clBlack;
      FillRect(Rect);
      TextOut(
      Rect.Left+2,Rect.Top+4,
      RegisterStringGrid.Cells[ACol,ARow]);
    end;
    exit;
  end;

  (*
  if (ARow = 0) or (ARow = 3) or (ARow = 6) then
  RegisterStringGrid.Canvas.FillRect(Rect);

  if ((ARow = 3) or (ARow = 6)) and
     ((ACol = 1) or (ACol = 3) or
      (ACol = 5) or (ACol = 7))
  then begin
    with RegisterStringGrid.Canvas do
    begin
      Rect.Right :=
      Rect.Right + RegisterStringGrid.GridLineWidth;

      if (ARow = 0) or (ARow = 3) or (ARow = 6) then
      RegisterStringGrid.Canvas.FillRect(Rect);

      Pen.Color := clGray;
      Pen.Width := 1;
      Pen.Style := psSolid;

      MoveTo(Rect.Left,Rect.Top);
      LineTo(Rect.Left,Rect.Top + 20);

      MoveTo(Rect.Left ,Rect.Top);
      LineTo(Rect.Right,Rect.Top);

      MoveTo(Rect.Left, Rect.Bottom);
      LineTo(Rect.Right,Rect.Bottom);
    end;
  end;

  if (ARow = 3) or (ARow = 6) then
  begin
    if (ACol = 2) or (ACol = 4)
    or (ACol = 6) or (ACol = 8) then
    begin
      with RegisterStringGrid.Canvas do
      begin
        MoveTo(Rect.Left ,Rect.Top);
        LineTo(Rect.Right,Rect.Top);

        MoveTo(Rect.Left ,Rect.Bottom);
        LineTo(Rect.Right,Rect.Bottom);
      end;
    end;
  end;

  if (ARow = 4) or (ARow = 5) then
  begin
    if (ACol > 0) and (ACol < 9) then
    begin
      with RegisterStringGrid.Canvas do
      begin
        MoveTo(Rect.Left ,Rect.Bottom);
        LineTo(Rect.Right,Rect.Bottom);
      end;
    end;
  end;

  if (ARow = 4) or (ARow = 5)
  or (ARow = 7) or (ARow = 8) then
  begin
    if (ACol = 1) or (ACol = 3) or (ACol = 5) or (ACol = 7) then
    begin
      with RegisterStringGrid.Canvas do
      begin
        MoveTo(Rect.Left,Rect.Top);
        LineTo(Rect.Left,Rect.Bottom);
      end;
    end;
  end;

  if (ARow = 8) or (ARow = 0) then
  begin
    if (ACol > 0) and (ACol < 9) then
    begin
      with RegisterStringGrid.Canvas do
      begin
        MoveTo(Rect.Left ,Rect.Top);
        LineTo(Rect.Right,Rect.Top);

        MoveTo(Rect.Left ,Rect.Bottom);
        LineTo(Rect.Right,Rect.Bottom);
      end;
    end;
  end;

  if (ARow = 1) and (ACol > 0) then
  begin
    RegisterStringGrid.Canvas.Brush.Color := clWhite;
    RegisterStringGrid.Canvas.FillRect(Rect);

    RegisterStringGrid.Canvas.TextOut(
    Rect.Left+2,Rect.Top+4,
    RegisterStringGrid.Cells[ARow,ACol]);

    exit;
  end;

  if (ACol = 0) then
  begin
    RegisterStringGrid.Canvas.Brush.Color := clBtnFace;
    RegisterStringGrid.Canvas.TextOut(
    Rect.Left+2,Rect.Top+4,
    RegisterStringGrid.Cells[ARow,ACol]);

    exit;
  end;

  if (ARow in [1,2,4,5,7,8]) then
  begin
    RegisterStringGrid.Canvas.Brush.Color := clWhite;
    RegisterStringGrid.Canvas.Fonr .Color := clBlack;
    RegisterStringGrid.Canvas.TextOut(
    Rect.Left+2,Rect.Top+4,
    RegisterStringGrid.Cells[ARow,ACol]);
  end;*)
end;

procedure TApplicationForm.FormCreate(Sender: TObject);
var
  i,j: Integer;
begin
  with RegisterStringGrid do
  begin
    for i := 0 to 8 do begin
    for j := 0 to 8 do begin
      if (i = 0) and (i = 3) and (i = 6) then
      Font.Color := clBlack else
      Font.Color := clWhite;
      Cells[i,j] := '';
    end;  end;

    Cells[0,0] := '';
    Cells[0,3] := '';
    Cells[0,6] := '';

    Cells[1,0] := 'AL';
    Cells[2,0] := 'AH';
    Cells[3,0] := 'BL';
    Cells[4,0] := 'BH';
    Cells[5,0] := 'CL';
    Cells[6,0] := 'CH';
    Cells[7,0] := 'DL';
    Cells[8,0] := 'DH';

    Cells[0,1] := 'old value:';
    Cells[0,2] := 'new value:';

    Cells[1,3] := 'AX';
    Cells[3,3] := 'BX';
    Cells[5,3] := 'CX';
    Cells[7,3] := 'DX';

    Cells[0,4] := 'old value:';
    Cells[0,5] := 'new value:';

    Cells[1,6] := 'EAX';
    Cells[3,6] := 'EBX';
    Cells[5,6] := 'ECX';
    Cells[7,6] := 'EDX';

    Cells[0,7] := 'old value:';
    Cells[0,8] := 'new value:';

    //---
    Cells[1,1] := ' 0x00';
    Cells[1,2] := ' 0x00';

    Cells[2,1] := ' 0x00';
    Cells[2,2] := ' 0x00';

    Cells[3,1] := ' 0x00';
    Cells[3,2] := ' 0x00';

    Cells[4,1] := ' 0x00';
    Cells[4,2] := ' 0x00';

    Cells[5,1] := ' 0x00';
    Cells[5,2] := ' 0x00';

    Cells[6,1] := ' 0x00';
    Cells[6,2] := ' 0x00';

    Cells[7,1] := ' 0x00';
    Cells[7,2] := ' 0x00';

    Cells[8,1] := ' 0x00';
    Cells[8,2] := ' 0x00';
    //---


    Cells[1,4] := ' 0x0000';
    Cells[1,5] := ' 0x0000';

    Cells[3,4] := ' 0x0000';
    Cells[3,5] := ' 0x0000';

    Cells[5,4] := ' 0x0000';
    Cells[5,5] := ' 0x0000';

    Cells[7,4] := ' 0x0000';
    Cells[7,5] := ' 0x0000';
    //---

    Cells[1,7] := ' 0x0000 0000';
    Cells[1,8] := ' 0x0000 0000';

    Cells[3,7] := ' 0x0000 0000';
    Cells[3,8] := ' 0x0000 0000';

    Cells[5,7] := ' 0x0000 0000';
    Cells[5,8] := ' 0x0000 0000';

    Cells[7,7] := ' 0x0000 0000';
    Cells[7,8] := ' 0x0000 0000';

  end;

  with FlagsStringGrid do
  begin
    Cells[0, 0] := ' 1.';
    Cells[0, 1] := ' 2.';
    Cells[0, 2] := ' 3.';
    Cells[0, 3] := ' 4.';
    Cells[0, 4] := ' 5.';
    Cells[0, 5] := ' 6.';
    Cells[0, 6] := ' 7.';
    Cells[0, 7] := ' 8.';
  end;
end;

end.
