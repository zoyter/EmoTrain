unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, XMLConf, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, Menus;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    imgAva1: TImage;
    imgAva10: TImage;
    imgAvatar1: TImage;
    imgAva2: TImage;
    imgAva3: TImage;
    imgAva4: TImage;
    imgAva5: TImage;
    imgAva6: TImage;
    imgAva7: TImage;
    imgAva8: TImage;
    imgAva9: TImage;
    imgAvatar: TImage;
    imgFind1: TImage;
    imgFind2: TImage;
    imgFind3: TImage;
    imgFind4: TImage;
    imgSettings: TImage;
    imgHelp: TImage;
    Label1: TLabel;
    lblStart: TLabel;
    lblClose: TLabel;
    lblStart1: TLabel;
    lblSubTitle: TLabel;
    lblSubTitle1: TLabel;
    lblTask: TLabel;
    lblSubTitle3: TLabel;
    lblTitle: TLabel;
    lblTitle1: TLabel;
    panAva1: TPanel;
    panAva10: TPanel;
    Panel1: TPanel;
    panAva2: TPanel;
    panAva3: TPanel;
    panAva4: TPanel;
    panAva5: TPanel;
    panAva6: TPanel;
    panAva7: TPanel;
    panAva8: TPanel;
    panAva9: TPanel;
    panClose: TPanel;
    panFindImg1: TPanel;
    panFindImg2: TPanel;
    panFindImg3: TPanel;
    panFindImg4: TPanel;
    panMain: TPanel;
    panMain1: TPanel;
    panSide: TPanel;
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgAva1Click(Sender: TObject);
    procedure imgAva1MouseEnter(Sender: TObject);
    procedure imgAva1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure lblStartClick(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
    procedure lblCloseMouseEnter(Sender: TObject);
    procedure lblCloseMouseLeave(Sender: TObject);
    procedure lblStartMouseEnter(Sender: TObject);
    procedure lblStartMouseLeave(Sender: TObject);
    procedure lblSubTitle2Click(Sender: TObject);
  private

  public

  end;

var
  frmMain: TfrmMain;
  Game1TaskNumber: Integer;
  Game1Tasks: TStringList;

implementation

{$R *.lfm}
//https://www.iconfinder.com/avatars-smiley-icons?order_by=popularity
//https://www.vecteezy.com/free-vector/emotion?license-standard=true&from=mainsite&in_se=true

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  BorderStyle := bsNone;
  Application.MainForm.WindowState:=wsFullScreen;
  panMain1.Visible:=False;
  panMain.Visible:=True;
  panSide.Width:=Label1.Width;
  panMain.Width:=frmMain.ClientWidth;
  panMain.Height:=frmMain.ClientHeight;
  panMain.Left:=0;
  panMain.Top:=0;

  panMain1.Width:=frmMain.ClientWidth;
  panMain1.Height:=frmMain.ClientHeight;
  panMain1.Left:=0;
  panMain1.Top:=0;

  panClose.Width:=lblClose.Width;
  panClose.Height:=lblClose.Height;

  panMain.Color:=clDefault;
  panMain1.Color:=clDefault;

  panClose.BringToFront;
  panSide.BringToFront;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Game1TaskNumber:=1;
  Game1Tasks.LoadFromFile('game\g1\info.txt');
//  lblTask.Caption:=Game1Tasks.Strings[Game1TaskNumber];

end;

procedure TfrmMain.Button3Click(Sender: TObject);
var f : TextFile;
    buf : String;
begin
  //AssignFile(f,'game\g1\info.txt');
  //Reset(f);
  //Readln(f,buf);
  //CloseFile(f);
  //lblTask.Caption:=buf;
  Game1TaskNumber:=Game1TaskNumber+1;

  if Game1TaskNumber > Game1Tasks.Count then Game1TaskNumber:=0;
  lblTask.Caption:=Game1Tasks.Strings[Game1TaskNumber];

end;


procedure TfrmMain.imgAva1Click(Sender: TObject);
begin
  imgAvatar.Picture:= (Sender as TImage).Picture;
  imgAvatar1.Picture:= (Sender as TImage).Picture;
end;

procedure TfrmMain.imgAva1MouseEnter(Sender: TObject);
begin
  (Sender as TImage).Parent.Color:=clRed;
end;

procedure TfrmMain.imgAva1MouseLeave(Sender: TObject);
begin
  (Sender as TImage).Parent.Color:=clDefault;
end;

procedure TfrmMain.Label1Click(Sender: TObject);
begin
  if panSide.Width<imgHelp.Width div 2 then begin
    panSide.Width:=imgHelp.Width+Label1.Width*2;
    panSide.Color:=clGray;
    Label1.Color:=clRed;
    Label1.Font.Color:=clWhite;
    Label1.Caption:='>';
  end
  else begin
    panSide.Width:=Label1.Width;
    panSide.Color:=clDefault;
    Label1.Caption:='<';
  end;
end;

procedure TfrmMain.Label1MouseEnter(Sender: TObject);
begin
  Label1.Color:=clRed;
  Label1.Font.Color:=clWhite;
end;

procedure TfrmMain.Label1MouseLeave(Sender: TObject);
begin
  if panSide.Width>imgHelp.Width div 2 then begin
    panSide.Width:=imgHelp.Width+Label1.Width*2;
    panSide.Color:=clGray;
    Label1.Color:=clRed;
    Label1.Font.Color:=clWhite;
    Label1.Caption:='>';
  end
  else begin
    Label1.Color:=clNone;
    Label1.Font.Color:=clGray;
  end;

end;

procedure TfrmMain.lblStartClick(Sender: TObject);
begin
  panMain.Visible:=False;
  panMain1.Visible:=True;
end;

procedure TfrmMain.lblCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.lblCloseMouseEnter(Sender: TObject);
begin
  lblClose.Font.Color:=clWhite;
  lblClose.Color:=clRed;
end;

procedure TfrmMain.lblCloseMouseLeave(Sender: TObject);
begin
  lblClose.Font.Color:=clGray;
  lblClose.Color:=clNone;
end;

procedure TfrmMain.lblStartMouseEnter(Sender: TObject);
begin
  lblStart.Font.Size:=48;
end;

procedure TfrmMain.lblStartMouseLeave(Sender: TObject);
begin
  lblStart.Font.Size:=40;
end;

procedure TfrmMain.lblSubTitle2Click(Sender: TObject);
begin
  imgAvatar.Picture:=imgAva8.Picture;
end;





end.

