unit NUMMIMaskEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls, Mask;

type
  TNUMMIMaskEdit = class(TMaskEdit)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure WndProc(var Message: TMessage); override;
  public
    { Public declarations }
    function CanFocus:boolean; Override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

function TNUMMIMaskEdit.CanFocus: boolean;
begin
  if readonly then
    result:=false
  else
    result:=Inherited CanFocus;
end;

procedure TNUMMIMaskEdit.WndProc(var Message: TMessage);
begin

  case Message.Msg of
    WM_MOUSEFIRST..WM_MOUSELAST:
         if ReadOnly and (not (csDesigning in ComponentState)) then Exit;
    WM_KEYFIRST..WM_KEYLAST:
         if ReadOnly and (not (csDesigning in ComponentState)) then Exit;
  end;

  Inherited WndProc(Message);

end;


procedure Register;
begin
  RegisterComponents('NUMMI Tools', [TNUMMIMaskEdit]);
end;

end.
