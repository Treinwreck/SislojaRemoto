unit UItensVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons, Mask, rxToolEdit, rxCurrEdit,
  MegaEditNumerico, ExtCtrls, XP_Form;

type
  TFrmItensVenda = class(TForm)
    Label1: TLabel;
    Ednota: TEdit;
    Label3: TLabel;
    lbnome: TLabel;
    Label13: TLabel;
    lbvend: TLabel;
    ednadic: TEdit;
    Label18: TLabel;
    Label2: TLabel;
    edt: TEdit;
    Label12: TLabel;
    Label10: TLabel;
    Label16: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    BtnGravar: TBitBtn;
    EdPrTotal: TMegaEditNumerico;
    eddesconto: TCurrencyEdit;
    edprunitario: TMegaEditNumerico;
    EdQuantidade: TEdit;
    eddescricao: TEdit;
    Button2: TButton;
    edref: TCurrencyEdit;
    Button1: TButton;
    Edcodigo: TEdit;
    Label9: TLabel;
    DBGrid2: TDBGrid;
    BitBtn7: TBitBtn;
    EdControle: TEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Button3: TButton;
    BitBtn2: TBitBtn;
    Label15: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    Label11: TLabel;
    vlim: TLabel;
    Shape1: TShape;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure EdPrTotalExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure EdQuantidadeExit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure edtExit(Sender: TObject);
    procedure eddescontoExit(Sender: TObject);
    procedure EdcodigoExit(Sender: TObject);
    procedure edrefExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edrefEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ednadicExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vgeral    : currency;
    vqtd      : integer;
    vcontrole : integer;
    icancela:string;
    vm1 : array[1..100] of currency;
    vm2 : integer;
    limite:currency;
    vcli:integer;
    vtipo:string;
    erro:integer;
    lista:integer;
  end;

var
  FrmItensVenda: TFrmItensVenda;

implementation

uses DM, UPrincipal, UFechaVenda, UNotaVenda, UProdutos, UPrestacoes1,
  UListaProdutos, Uprecos;

{$R *.DFM}

procedure TFrmItensVenda.BitBtn3Click(Sender: TObject);
begin
   { if edit2.Text <> '' then
        begin
            with ibdm.IBQProdutos do
            begin
                close;
                sql.Clear;
                sql.Add('select * from Produtos');
                sql.Add('where descricao LIKE :p1');
                params[0].AsString := Trim(edit2.Text)+'%';
                open;
            end;
        end
       else
       begin
           with ibdm.IBQProdutos do
           begin
               close;
               sql.Clear;
               sql.Add('select * from produtos');
               open;
           end;
       end;

       if (edit1.Text <> '') and (edit2.Text = '') then
       begin
       if edit1.Text <> '' then
       begin
           with ibdm.IBQProdutos do
            begin
                close;
                sql.Clear;
                sql.Add('select * from produtos');
                sql.Add('where codigo LIKE :p1');
                params[0].AsString := Trim(edit1.Text)+'%';
                open;
            end;
       end
       else
       begin
           with ibdm.IBQProdutos do
           begin
               close;
               sql.Clear;
               sql.Add('select * from Produtos');
               open;
           end;
       end;
    end;}
end;

procedure TFrmItensVenda.BitBtn2Click(Sender: TObject);
    var
    msg:integer;
    qcontrole:integer;
begin
 {   label3.Caption := ibdm.IBQProdutosDESCRICAO.Value;
 //   edproduto.Text := ibdm.ibqprodutoscodigo.AsString;
    edprunitario.Value := ibdm.IBQProdutosPRECOVENDA.Value;
    edquantidade.SetFocus;

    Close;}

    msg := Application.MessageBox('Deseja Cancelar esta Venda ???','Confirma��o',68);
    if msg = 6 then
    begin
            Log('Cancelou a venda !!');

          qcontrole:=vcontrole;
          with ibdm.Deleta do
          begin
              Close;
              sql.Clear;
              sql.Add('Delete from movimento');
              sql.Add('Where contdoc = :p0');
              params[0].asinteger := qcontrole;
              ExecQuery;
          end;
          CommitWork;
          with ibdm.Deleta do
          begin
              Close;
              sql.Clear;
              sql.Add('Delete from doctos');
              sql.Add('Where controle = :p0');
              params[0].asinteger := qcontrole;
              ExecQuery;
          end;
          CommitWork;
          if ibdm.IBQParamUSAECF.AsString = 'S' then
          begin
            iretorno:=Bematech_FI_CancelaCupom;
            FrmPrincipal.Analisa_iRetorno();
            frmPrincipal.Retorno_Impressora();
          end;

        Close;
    end;
end;

procedure TFrmItensVenda.BtnGravarClick(Sender: TObject);
var
    sep:Char;
    i:integer;
    vtxt:pchar;
    vtxt1:pchar;
    Final : pchar;
    vcod : pchar;
    vdescr : pchar;
    valiq : pchar;
    vint : pchar;
    vquant : pchar;
    vtotal : pchar;
    vtotvend : pchar;
    idecimaml:integer;
    sTipoDesconto :pchar;
    desconto :string;
    vval :string;
    msg : integer;
    vcont : integer;
    vest : currency;
    vresult : currency;
    vcod1 : string;
begin
    with ibdm.Cheka do
    begin
        Close;
        sql.Clear;
        sql.Add('Update DOCTOS');
        sql.Add('Set  nome=:p0,nadic=:p1');
        sql.Add('Where controle=:p2');
        params[0].AsString := lbnome.Caption;
        params[1].AsString := ednadic.Text;
        Params[2].AsInteger := vcontrole;
        ExecQuery;
    end;
    bitbtn1.Enabled := True;
    if ibdm.IBQParamUSAECF.AsString = 'S' then
    begin
        // Inicio dos codigos da IMPRESSORA FISCAL...
        with ibdm.IBQProdutos do
        begin
        if locate('codigo',edcodigo.text,[]) then
            begin
                if 0<0 then //if fieldbyname('estoque').asinteger <= 0 then
                   begin
                      // msg:=Application.MessageBox
                      //      ('Estoque abaixo de ZERO, deseja vender este item?','Comercial',68);
                        msg:=6;
                        if msg = 6 then
                            begin
                                    Sep:=',';
                                    I := AnsiPos(sep,edprunitario.Text);
                                    if I = 0 then
                                     begin
                                          vtxt := Pchar(edprunitario.text+'00');
                                     end
                                    else
                                     begin
                                          vval := edprunitario.Text + '00';
                                          vtxt := Pchar(Copy(vval, 1, I - 1)+Copy(vval, I + 1, 2 ));
                                     end;
                                    final:= vtxt ;
                                    vquant := Pchar(edquantidade.Text);

                                    vm1[vm2] := strtocurr(edprunitario.Text) * Strtocurr(edquantidade.Text);
                                    vm2 := vm2 + 1;

                                    vgeral := vgeral + ( strtocurr(edprunitario.Text) * Strtocurr(edquantidade.Text) );
                                    vqtd := vqtd + Strtoint(edquantidade.text);
                                    Label7.Caption := Formatcurr('0.00',vgeral);
                                    Label7.Refresh;
                                    label17.Caption := inttostr(vqtd);
                                    label17.Refresh;

                                    idecimal := 2;
                                  //  If RadioButton7.Checked = True Then Begin sTipoDesconto := '%' End;
                                  //  If RadioButton8.Checked = True Then Begin sTipoDesconto := '$' End;

                                    vcod := Pchar(edcodigo.text);
                                    vdescr := Pchar(Copy(label3.caption,1,28));
                                    valiq := Pchar(Currtostr(ibdm.ibqprodutosicms.ascurrency*100));  //'1700';
                                    vint := 'I';
                                    desconto := '0';

                                    iRetorno := Bematech_FI_VendeItem( vcod, vdescr, valiq, vint, vquant, iDecimal, final, sTipoDesconto, desconto );
                                    FrmPrincipal.Analisa_iRetorno();
                                    frmPrincipal.Retorno_Impressora();

                                    vest := ibdm.IBQProdutosESTOQUE.AsCurrency;
                                    vresult := vest - strtocurr(edquantidade.text);
                                    vcod1 := ibdm.IBQProdutosCODIGO.AsString;
                                {    with ibdm.Grava do
                                    begin
                                        close;
                                        sql.Clear;
                                        sql.Add('update produtos');
                                        sql.Add('set estoque=:p0');
                                        sql.Add('where codigo=:p1');
                                        params[0].AsCurrency := vresult;
                                        params[1].AsString := vcod1;
                                        prepare;
                                        execquery;
                                    end;
                                    commitwork;    }
                                    ibdm.IBQProdutos.Close;
                                    ibdm.IBQProdutos.Open;


                             //       vcontrole := ibdm.IBQDoctosCONTROLE.Asinteger;
                                    with ibdm.Consulta do
                                    begin
                                        close;
                                        sql.Clear;
                                        sql.Add('select max(controle) from movimento');
                                        prepare;
                                        open;
                                        vcont := fields[0].AsInteger + 1;
                                    end;
                                    with ibdm.Grava do
                                    begin
                                        close;
                                        sql.Clear;
                                        sql.Add('insert into movimento');
                                        sql.Add('(controle,docto,valorunitario,produto,quantidade,contdoc,data,cfop,descricao,ref)');
                                        sql.Add('values (:p0,:p1,:p2,:p3,:p4,:p5,:p6,:p7,:p8,:p9)');
                                        params[0].AsInteger := vcont;
                                        params[1].AsString := ednota.Text;
                                        params[2].AsCurrency := edprunitario.Value;
                                        params[3].Asstring := edcodigo.text;
                                        params[4].Ascurrency := strtocurr(edquantidade.text);
                                        params[5].AsInteger := vcontrole;
                                        params[6].AsDate := now;
                                        params[7].AsString := frmnotavenda.edcfop.Text;
                                        params[8].AsString := eddescricao.Text;
                                        params[9].AsInteger := edref.AsInteger;
                                        prepare;
                                        execquery;
                                    end;
                                    commitwork;
                                    ibdm.IBQMovimento.Close;
                                    ibdm.IBQMovimento.Open;

                                    with ibdm.IBQuery1 do
                                    begin
                                        close;
                                        sql.Clear;
                                        sql.Add('select controle,docto,produto,quantidade,valorunitario,descricao,cfop from movimento');
                                        sql.Add('where docto = :p0');
                                        params[0].AsString := ednota.Text;
                                       // params[1].AsInteger := vcont;
                                        open;
                                    end;
                                    edprunitario.Text := '';
                                    DBgrid2.Refresh;
                                    edcodigo.SetFocus;
                           end
                           else
                           begin
                               edcodigo.SetFocus;
                               edref.Text := ''  ;
                               eddescricao.Text := '';
                               edprunitario.Text := '';
                               edquantidade.Text := '1';
                               edprtotal.Text := '';
                           end;
                   end
                  else
                   begin
                      Sep:=',';
                      I := AnsiPos(sep,edprunitario.Text);
                      if I = 0 then
                          begin
                              vtxt := Pchar(edprunitario.Text+'00');
                          end
                         else
                          begin
                              vval := edprunitario.Text + '00';
                              vtxt := Pchar(Copy(vval, 1, I - 1)+Copy(vval, I + 1, 2 ));
                          end;
                          final:= vtxt ;
                          vquant := Pchar(edquantidade.Text);

                          vm1[vm2] := strtocurr(edprunitario.Text) * Strtocurr(edquantidade.text);
                          vm2 := vm2 + 1;
                          if eddesconto.Value = 0 then
                                        vgeral := vgeral + ( strtocurr(edprunitario.Text) * Strtocurr(edquantidade.Text) )
                                      else
                                        vgeral := vgeral + ( strtocurr(edprunitario.Text)-(edprunitario.value * eddesconto.Value / 100)) * Strtocurr(edquantidade.Text) ;
                          //vgeral := vgeral + ( strtocurr(edprunitario.Text) * Strtocurr(edquantidade.Text) );

                        //  Label7.Caption := Formatcurr('0.00',vgeral);
                        //  Label7.Refresh;
                          vqtd := vqtd + Strtoint(edquantidade.text);
                          Label7.Caption := Formatcurr('0.00',vgeral);
                          Label7.Refresh;
                          label17.Caption := inttostr(vqtd);
                          label17.Refresh;


                          idecimal := 2;
                          sTipoDesconto := '%';
                      //    If RadioButton7.Checked = True Then Begin sTipoDesconto := '%' End;
                      //    If RadioButton8.Checked = True Then Begin sTipoDesconto := '$' End;

                          vcod := Pchar(edcodigo.text);
                          vdescr := Pchar(Copy(eddescricao.text,1,28));
                          valiq := '1700';
                          vint := 'I';

                           Sep:=',';
                            I := AnsiPos(sep,eddesconto.Text);
                            if I = 0 then
                                begin
                                    if eddesconto.Value < 10 then
                                        desconto := '0'+eddesconto.Text
                                       else
                                        desconto := eddesconto.Text
                                end
                               else
                                begin
                                    vval := eddesconto.Text ;
                                    if eddesconto.Value < 10 then
                                        desconto := '0'+Copy(vval, 1, I - 1)+Copy(vval, I + 1, 2 )
                                       else
                                        desconto := Copy(vval, 1, I - 1)+Copy(vval, I + 1, 2 );
                                end;


                          //desconto := FormatCurr('0.00',eddesconto.value); //  Pchar(Inttostr(eddesconto.asinteger));

                          iRetorno := Bematech_FI_VendeItem( vcod, vdescr, valiq, vint, vquant, iDecimal, final, sTipoDesconto, desconto );
                          FrmPrincipal.Analisa_iRetorno();
                          frmPrincipal.Retorno_Impressora();

                           vest := ibdm.IBQProdutosESTOQUE.AsCurrency;
                           vresult := vest - strtocurr(edquantidade.text);
                           vcod1 := ibdm.IBQProdutosCODIGO.Asstring;
                      {     with ibdm.Grava do
                           begin
                               close;
                               sql.Clear;
                               sql.Add('update produtos');
                               sql.Add('set estoque=:p0');
                               sql.Add('where codigo = :p1');
                               params[0].AsCurrency := vresult;
                               params[1].AsString := vcod1;
                               prepare;
                               execquery;
                           end;
                           commitwork;     }
                           ibdm.IBQProdutos.Close;
                           ibdm.IBQProdutos.Open;
                        //   dbgrid1.Refresh;

                       //    vcontrole := ibdm.IBQDoctosCONTROLE.AsInteger;
                          with ibdm.Consulta do
                          begin
                              close;
                              sql.Clear;
                              sql.Add('select max(controle) from movimento');
                              prepare;
                              open;
                              vcont := fields[0].AsInteger + 1;
                          end;
                          with ibdm.Grava do
                          begin
                              close;
                              sql.Clear;
                              sql.Add('insert into movimento');
                              sql.Add('(controle,docto,valorunitario,produto,quantidade,contdoc,cfop,data,descricao,ref)');
                              sql.Add('values (:p0,:p1,:p2,:p3,:p4,:p5,:p6,:p7,:p8,:p9)');
                              params[0].AsInteger := vcont;
                              params[1].AsString := ednota.Text;
                              params[2].AsCurrency := edprunitario.AsCurrency;
                              params[3].Asstring := edcodigo.text;
                              params[4].Ascurrency := strtocurr(edquantidade.text);
                              params[5].AsInteger := vcontrole;
                              params[6].AsString := frmnotavenda.edcfop.Text;
                              params[7].AsDate := int(now());
                              params[8].AsString:=eddescricao.Text;
                              params[9].AsInteger := edref.AsInteger;
                              prepare;
                              execquery;
                          end;
                          commitwork;
                          ibdm.IBQMovimento.Close;
                          ibdm.IBQMovimento.Open;

                          with ibdm.IBQuery1 do
                           begin
                               close;
                               sql.Clear;
                               sql.Add('select controle,docto,produto,quantidade,valorunitario,descricao, cfop from movimento');
                               sql.Add('where docto = :p0');
                               params[0].AsString := ednota.Text;
                            //   params[1].AsInteger := vcont;
                               open;
                           end;
                     //     edit2.Text := '';
                          DBgrid2.Refresh;
                          edcodigo.SetFocus;
                  end;
            end;
        end;
        Log('Item: '+ Edcodigo.Text+' - '+eddescricao.Text+' Ref. '+inttostr(edref.AsInteger)+' Preco: '+FormatCurr('0.00',EdPrTotal.Value) );

        vlim.caption := FormatCurr('0.00' ,Strtocurr(vlim.caption) - edprtotal.value);
        edcodigo.text := '';
        eddescricao.Text := '';
        edref.Value := 0;
        edquantidade.text := '1';
        edprunitario.AsCurrency := 0;
        edprtotal.AsCurrency := 0;
        label3.Caption := 'Nome do Produto';
      //  bitbtn4.Enabled := true;
        bitbtn5.Enabled := true;
        bitbtn6.Enabled := true;
    //    vlim.caption := FormatCurr('0.00' ,Strtocurr(vlim.caption) - edprtotal.value);
        vlim.Refresh;

      //  ibdm.IBQDoctos.Last;
    // fim do codigo da IMPRESSORA FISCAL...
    end;

    if ibdm.IBQParamUSAECF.AsString = 'N' then
    begin
        with ibdm.IBQProdutos do
        begin
            close;
            open;
            if locate('codigo',edcodigo.text,[]) then
            begin
                if 0 = 0 then
                   begin
                       msg:=6;
                        if msg = 6 then
                            begin
                                    Sep:=',';
                                    I := AnsiPos(sep,edprunitario.Text);
                                    if I = 0 then
                                     begin
                                          vtxt := Pchar(edprunitario.Text+'00');
                                     end
                                    else
                                     begin
                                          vval := edprunitario.Text + '00';
                                          vtxt := Pchar(Copy(vval, 1, I - 1)+Copy(vval, I + 1, 2 ));
                                     end;
                                    final:= vtxt ;
                                    vquant := Pchar(edquantidade.Text);

                                    if eddesconto.Value > 0 then
                                    begin
                                    vm1[vm2] := edprunitario.value - (edprunitario.value*eddesconto.Value / 100) * Strtocurr(edquantidade.Text);
                                    end
                                    else
                                    vm1[vm2] := strtocurr(edprunitario.Text) * Strtocurr(edquantidade.Text);
                                    vm2 := vm2 + 1;
                                    if eddesconto.Value = 0 then
                                        vgeral := vgeral + ( strtocurr(edprunitario.Text) * Strtocurr(edquantidade.Text) )
                                      else
                                        vgeral := vgeral + ( strtocurr(edprunitario.Text)-(edprunitario.value * eddesconto.Value / 100)) * Strtocurr(edquantidade.Text) ;
                                    {Label7.Caption := Formatcurr('0.00',vgeral);
                                    Label7.Refresh;}
                                    vqtd := vqtd + Strtoint(edquantidade.text);
                                    Label7.Caption := Formatcurr('0.00',vgeral);
                                    Label7.Refresh;
                                    label17.Caption := inttostr(vqtd);
                                    label17.Refresh;
                                    idecimal := 2;


                                    vcod := Pchar(edcodigo.text);
                                    vdescr := Pchar(Copy(label3.caption,1,28));
                                    valiq := '1700';
                                    vint := 'I';
                                    desconto := '0';

                                    vest := ibdm.IBQProdutosESTOQUE.AsCurrency;
                                    vresult := vest - strtocurr(edquantidade.text);
                                    vcod1 := ibdm.IBQProdutosCODIGO.AsString;
                         {           with ibdm.Grava do
                                    begin
                                        close;
                                        sql.Clear;
                                        sql.Add('update produtos');
                                        sql.Add('set estoque=:p0');
                                        sql.Add('where codigo=:p1');
                                        params[0].AsCurrency := vresult;
                                        params[1].AsString := vcod1;
                                        prepare;
                                        execquery;
                                    end;
                                    commitwork;
                          }
                             //       vcontrole := ibdm.IBQDoctosCONTROLE.Asinteger;
                                   with ibdm.Consulta do
                                    begin
                                        close;
                                        sql.Clear;
                                        sql.Add('select max(controle) from movimento');
                                        prepare;
                                        open;
                                        vcont := Fields[0].AsInteger + 1;
                                    end;
                                    with ibdm.Grava do
                                    begin
                                        close;
                                        sql.Clear;
                                        sql.Add('insert into movimento');
                                        sql.Add('(controle,docto,valorunitario,produto,quantidade,contdoc,data,cfop,descricao,ref)');
                                        sql.Add('values (:p0,:p1,:p2,:p3,:p4,:p5,:p6,:p7,:p8,:p9)');
                                        params[0].AsInteger := vcont;
                                        params[1].AsString := ednota.Text;
                                        if eddesconto.Value > 0 then
                                        params[2].AsCurrency := edprunitario.AsCurrency-(edprunitario.AsCurrency  * (eddesconto.Value / 100) )
                                        else
                                        params[2].AsCurrency := edprunitario.AsCurrency ;
                                        params[3].Asstring := edcodigo.text;
                                        params[4].Ascurrency := strtocurr(edquantidade.text);;
                                        params[5].AsInteger := vcontrole;
                                        params[6].AsDate := now;
                                        params[7].AsString := frmnotavenda.edcfop.Text ;
                                        params[8].AsString := eddescricao.Text;
                                        params[9].AsInteger := edref.AsInteger;
                                        prepare;
                                        execquery;
                                    end;
                                    commitwork;
                                    ibdm.IBQMovimento.Close;
                                    ibdm.IBQMovimento.Open;

                                    with ibdm.IBQuery1 do
                                    begin
                                        close;
                                        sql.Clear;
                                        sql.Add('select controle,docto,produto,quantidade,valorunitario,descricao,cfop from movimento');
                                        sql.Add('where docto = :p0');
                                        params[0].AsString := ednota.Text;
                             //           params[1].asinteger := vcont;
                                        prepare;
                                        open;
                                    end;
                                    edprunitario.Text := '0';
                                    DBgrid2.Refresh;
                                    edcodigo.SetFocus;
                           end
                           else
                           begin
                               edcodigo.SetFocus;
                               edref.Text := '';
                               eddescricao.Text := '';
                               edprunitario.Text := '';
                               edquantidade.Text := '1';
                               edprtotal.Text := '';
                           end;
                   end
                  else
                   begin
                      Sep:=',';
                      I := AnsiPos(sep,edprunitario.Text);
                      if I = 0 then
                          begin
                              vtxt := Pchar(edprunitario.Text+'00');
                          end
                         else
                          begin
                              vval := edprunitario.Text + '00';
                              vtxt := Pchar(Copy(vval, 1, I - 1)+Copy(vval, I + 1, 2 ));
                          end;
                          final:= vtxt ;
                          vquant := Pchar(edquantidade.Text);
                          if eddesconto.Value > 0 then
                            vm1[vm2] := strtocurr(edprunitario.Text)- (edprunitario.Value * eddesconto.value/100) * Strtocurr(edquantidade.text)
                            else
                            vm1[vm2] := strtocurr(edprunitario.Text) * Strtocurr(edquantidade.text);
                          vm2 := vm2 + 1;
                          if eddesconto.Value > 0 then
                          vgeral := vgeral + ( strtocurr(edprunitario.Text)- (edprunitario.value*eddesconto.value/100) * Strtocurr(edquantidade.Text) )
                          else
                          vgeral := vgeral + ( strtocurr(edprunitario.Text) * Strtocurr(edquantidade.Text) );

                         { Label7.Caption := Formatcurr('0.00',vgeral);
                          Label7.Refresh;}
                          vqtd := vqtd + Strtoint(edquantidade.text);
                                    Label7.Caption := Formatcurr('0.00',vgeral);
                                    Label7.Refresh;
                                    label17.Caption := inttostr(vqtd);
                                    label17.Refresh;

                          idecimal := 2;

                          vcod := Pchar(edcodigo.text);
                          vdescr := Pchar(Copy(label3.caption,1,28));
                          valiq := '1700';
                          vint := 'I';
                          desconto := '0';

                           vest := ibdm.IBQProdutosESTOQUE.AsCurrency;
                           vresult := vest - strtocurr(edquantidade.text);
                           vcod1 := ibdm.IBQProdutosCODIGO.AsString;
                          { with ibdm.Grava do
                           begin
                               close;
                               sql.Clear;
                               sql.Add('update produtos');
                               sql.Add('set estoque=:p0');
                               sql.Add('where codigo = :p1');
                               params[0].AsCurrency := vresult;
                               params[1].AsString := vcod1;
                               prepare;
                               execquery;
                           end;
                           commitwork;    }
                           ibdm.IBQProdutos.Close;
                           ibdm.IBQProdutos.Open;
                         //  dbgrid1.Refresh;

                //           vcontrole := ibdm.IBQDoctosCONTROLE.AsInteger;
                          with ibdm.Consulta do
                          begin
                            close;
                            sql.Clear;
                            sql.Add('select max(controle) from movimento');
                            prepare;
                            open;
                            vcont := Fields[0].AsInteger + 1;
                          end;
                          with ibdm.Grava do
                          begin
                              close;
                              sql.Clear;
                              sql.Add('insert into movimento');
                              sql.Add('(controle,docto,valorunitario,produto,quantidade,contdoc,cfop,data,descricao,ref)');
                              sql.Add('values (:p0,:p1,:p2,:p3,:p4,:p5,:p6,:p7,:p8,:p9)');
                              params[0].AsInteger := vcont;
                              params[1].AsString := ednota.Text;
                              if eddesconto.Value>0 then
                              params[2].AsCurrency := edprunitario.AsCurrency- (edprunitario.AsCurrency*(eddesconto.value/100))
                              else
                              params[2].AsCurrency := edprunitario.AsCurrency;
                              params[3].Asstring := edcodigo.text;
                              params[4].Ascurrency := strtocurr(edquantidade.text);;
                              params[5].AsInteger := vcontrole;
                              params[6].AsString := frmnotavenda.edcfop.Text;
                              params[7].AsDate := int(now());
                              params[8].AsString := eddescricao.Text;
                              params[9].AsInteger := edref.AsInteger;
                              prepare;
                              execquery;
                          end;
                          commitwork;
                          ibdm.IBQMovimento.Close;
                          ibdm.IBQMovimento.Open;

                          with ibdm.IBQuery1 do
                           begin
                               close;
                               sql.Clear;
                               sql.Add('select controle,docto,produto,quantidade,valorunitario,cfop,descricao from movimento');
                               sql.Add('where docto = :p0');
                               params[0].AsString := ednota.Text;
                               prepare;
                               open;
                           end;
                    //      edit2.Text := '';
                          DBgrid2.Refresh;
                          edcodigo.SetFocus;
                  end;
            end;
        end;
        Log('Item: '+ Edcodigo.Text+' - '+eddescricao.Text+' Ref. '+inttostr(edref.AsInteger)+' Preco: '+FormatCurr('0.00',EdPrTotal.Value) );
      //  bitbtn4.Enabled := true;
      vlim.caption := FormatCurr('0.00' ,Strtocurr(vlim.caption) - edprtotal.value);
        bitbtn5.Enabled := true;
        bitbtn6.Enabled := true;
        edcodigo.text := '';
        eddesconto.AsInteger := 0;
        eddescricao.Text := '';
        edquantidade.Text := '1';
        edprunitario.AsCurrency := 0;
        edprtotal.AsCurrency := 0;
        label3.Caption := 'Nome do Produto';

        vlim.Refresh;
     //   ibdm.IBQDoctos.Last;
    end;
//    edit1.SetFocus;
    CommitWork;
end;

procedure TFrmItensVenda.BitBtn5Click(Sender: TObject);
var
    vtam : integer;
    vprod : integer;
    vprod1 : string;
    vqtd1 : integer;
    vqtd2 : integer;
    vvalor : currency;
begin
    iRetorno := Bematech_FI_CancelaItemAnterior();
    FrmPrincipal.Analisa_iRetorno();
    FrmPrincipal.Retorno_Impressora();
end;

procedure TFrmItensVenda.EdPrTotalExit(Sender: TObject);
  var

    vsaldo:Currency;
begin

    vsaldo:=StrToCurr(vlim.Caption) - EdPrTotal.Value;
    if vsaldo < 0 then
      Showmessage('Limite de compras ultrapassado, consulte administra��o !');

    if (frmnotavenda.tpvenda=1) and  (Strtocurr(vlim.Caption) <= 0) then
        Showmessage('Limite de compras ultrapassado, consulte administra��o !');

    btngravar.Enabled := true;
    btngravar.SetFocus;
end;

procedure TFrmItensVenda.BitBtn1Click(Sender: TObject);
begin
    LOG('Clicou em fechamento da venda');
    FrmPrestacoes1:=TFrmPrestacoes1.create(Application);
    FrmPrestacoes1.edvlmerc.Value := strtocurr(label7.caption);
    FrmPrestacoes1.vtipo := vtipo;
    FrmPrestacoes1.lbnome := lbnome.caption;
    FRmPrestacoes1.qcontrole := vcontrole;
    FrmPrestacoes1.simula := 0;
    FrmPrestacoes1.BtnFechar.Visible:=False;
    FRmPrestacoes1.lista := ibdm.IBQParamLISTA.AsInteger;
    FrmPrestacoes1.showmodal;
    FrmPrestacoes1.close;

    if FrmPrestacoes1.vfim = true then
    begin
      FrmPrestacoes1.Free;
      Close;
    end;


end;

procedure TFrmItensVenda.BitBtn6Click(Sender: TObject);
begin
    ShowMessage('Rotina em elabora��o.');
end;

procedure TFrmItensVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key =#13 then
    begin
        key := #0;
        Perform(WM_NEXTDLGCTL,0,0);
    end;
end;

procedure TFrmItensVenda.FormActivate(Sender: TObject);
begin
    ibdm.IBQProdutos.Close;
    ibdm.IBQProdutos.Open;
    IBDM.IBQuery1.Close;
end;

procedure TFrmItensVenda.BitBtn4Click(Sender: TObject);
begin
    FrmFechaVenda := TFrmFechaVenda.create(application);
    FrmFechaVenda.Edit2.AsCurrency := vgeral;
    FrmFechaVenda.Edit3.AsCurrency := vgeral;
    FrmFechaVenda.ShowModal;
    FrmFechaVenda.Free;
    close;
end;

procedure TFrmItensVenda.EdQuantidadeExit(Sender: TObject);
begin
    if edquantidade.Text <> '' then
    begin
        edprtotal.AsCurrency := (strtocurr(edquantidade.text) * edprunitario.AsCurrency);
        BtnGravar.Enabled := true;
    end
    else
    ShowMessage('Faltou informar a quantidade, a ser vendida!!!')
end;

procedure TFrmItensVenda.BitBtn7Click(Sender: TObject);
var
    msg : integer;
    vcod,vdoc : string;
    vqt : currency;
    vval: currency;
begin
    msg := Application.MessageBox('Deseja EXCLUIR este produto da VENDA???','Exclus�o de Produto',68);
    if msg = 6 then
    begin
        iRetorno := Bematech_FI_CancelaItemAnterior();
        FrmPrincipal.Analisa_iRetorno();
        FrmPrincipal.Retorno_Impressora();
        vcod := ibdm.IBQuery1.fieldbyname('produto').AsString;
        vqt := ibdm.IBQuery1.fieldbyname('quantidade').AsCurrency;
        vval := ibdm.IBQuery1.fieldbyname('valorunitario').ascurrency;
        vdoc := ibdm.IBQuery1.fieldbyname('docto').AsString;
        vgeraL := VGERAL - (vval * vqt);
        label7.Caption := Formatcurr('0.00',vgeral);
        Log('Excluiu item: '+vcod);
        with ibdm.IBQProdutos do
        begin
            close;
            sql.Clear;
            sql.Add('select * from produtos');
            sql.Add('where codigo =:p0');
            params[0].AsString := vcod;
            prepare;
            open;
            if fields[0].AsString <> '' then
            begin
                with ibdm.Grava do
                begin
                    close;
                    sql.Clear;
                    sql.Add('update produtos');
                    sql.Add('set estoque=:p0');
                    sql.Add('where codigo=:p1');
                    params[0].AsCurrency := ibdm.IBQProdutosESTOQUE.AsCurrency + vqt;
                    params[1].AsString := vcod;
                    prepare;
                    ExecQuery;
                end;
                ibdm.IBQProdutos.Close;
                ibdm.IBQProdutos.Open;
            end
            Else
                ShowMessage('N�o achei o c�digo do Produto, estoque n�o atualizado, atualize!!!');
        end;
        with ibdm.Deleta do
        begin
            close;
            sql.Clear;
            sql.Add('delete from movimento');
            sql.Add('where produto =:p0 and docto =:p1');
            params[0].AsString := vcod;
            params[1].AsString := vdoc;
            prepare;
            execquery;
        end;
        CommitWork;
        ibdm.IBQMovimento.Close;
        ibdm.IBQMovimento.Open;
        ibdm.IBQuery1.Close;
        ibdm.IBQuery1.Open;
    end;
    CommitWork;
end;

procedure TFrmItensVenda.edtExit(Sender: TObject);
begin
 //   if ((edt.Text <> 'A') .and. (edt.Text <> 'B')) then
 //   begin
 //       Showmessage('Informa��o incorreta, deve ser A ou B');
 //       edt.SetFocus;
 //   end;
end;

procedure TFrmItensVenda.eddescontoExit(Sender: TObject);
begin
    edprtotal.Value := edprunitario.value * strtoint(edquantidade.Text) - (( edprunitario.value * strtoint(edquantidade.Text))* ( eddesconto.value/100 ) );

end;

procedure TFrmItensVenda.EdcodigoExit(Sender: TObject);
begin
    erro:=0;
    with ibdm.IBQProdutos do
    begin
        Close;
        open;
        First;
        if Locate('codigo',edcodigo.Text,[]) then
            eddescricao.Text := FieldByname('descricao').asstring
           Else
            begin
                erro:=1;
             // Showmessage('C�digo n�o cadastrado ');
             // eddescricao.Text := 'C�digo n�o cadastrado !';
            end;


    end;
end;

procedure TFrmItensVenda.edrefExit(Sender: TObject);
    var
    faz:boolean;
begin
    faz:=True;
   {  with ibdm.IBQProdutos do
    begin
        if Locate('codigo',edcodigo.Text,[]) then
            eddescricao.Text := FieldByname('descricao').asstring
           Else
           begin
            Showmessage('C�digo de produto n�o cadastrado ');
            faz:=False;
           end;
    end;  }

    if erro = 0 then
    begin
    if edref.Value > 0 then
    begin
        ibdm.IBQParam.Open;
        with ibdm.IBTPrecos do
        begin
            Close;
            Open;
            If locate('ref',edref.asinteger,[]) then
                begin
                    if ibdm.IBQParamLISTA.AsInteger = 1 then
                        edprunitario.Value := FieldByname('preco').ascurrency
                       else
                        edprunitario.Value := FieldByname('preco2').ascurrency ;
                end
                Else
                begin
                Showmessage('Ref. de Pre�os n�o cadastrada !');
                edref.SetFocus;
                end;
        end;
    end
    Else
      begin
        Button2.Click;
       // Showmessage('Faltou informar a Ref de Pre�os !');
       // edref.SetFocus;
      end;
    end;
end;

procedure TFrmItensVenda.FormShow(Sender: TObject);
begin
    // ver se deve descontar contas, atrazos...
  {  With ibdm.Consulta do
    begin
        Close;
        sql.Clear;
        sql.Add('Select sum(valordevido) from creceber');
        sql.Add('Where cliente = :p0');
        params[0].AsInteger := vcli;
        Open;
        limite := limite - Fields[0].AsCurrency;
    end;     }
    vlim.Caption := formatcurr('0.00',limite);
    vlim.Refresh;
end;

procedure TFrmItensVenda.edrefEnter(Sender: TObject);
begin
    if erro = 1 then
        begin
          Showmessage('C�digo n�o cadastrado ');
          eddescricao.Text := 'C�digo n�o cadastrado !';
          edcodigo.SetFocus;
        end;
end;

procedure TFrmItensVenda.Button1Click(Sender: TObject);
begin
    //
    FrmProdutos:=TFrmProdutos.create(application);
    FrmProdutos.ShowModal;
    FrmProdutos.Free;
    edcodigo.SetFocus;
end;

procedure TFrmItensVenda.Button2Click(Sender: TObject);
begin
//
    Frmprecos := TFrmprecos.create(Application);
    FrmPrecos.label1.visible := True;
    Frmprecos.showmodal;
    Frmprecos.Free;
    edref.SetFocus;
end;

procedure TFrmItensVenda.Button3Click(Sender: TObject);
begin
    Close;
end;

procedure TFrmItensVenda.ednadicExit(Sender: TObject);
begin
  IF ednadic.Text<> '' then
    Log('Nome adicional '+ednadic.Text);
end;

end.
