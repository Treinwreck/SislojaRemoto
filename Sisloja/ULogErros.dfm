object FrmLogErros: TFrmLogErros
  Left = 156
  Top = 113
  Width = 589
  Height = 354
  Caption = 'Log de Erros'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 50
    Height = 13
    Caption = 'Per�odo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 168
    Top = 24
    Width = 8
    Height = 13
    Caption = 'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 40
    Width = 577
    Height = 233
    Color = clWhite
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Form'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataHora'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mensagem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Controle'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 273
    Top = 4
    Width = 97
    Height = 33
    Caption = 'Visualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D
      598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D59734241FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D59E6D4C4
      F7EBD7F3E5CFF2E3CEF2E2CAF0E1C7F0E1C6F0E1C6F0E1C7F0E1C7F0E1C7F3E6
      CBE7D5BD734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF8E5D59E3D0C2F4E7D5EFE0CEEEE0CCEEDECAEDDCC7EBDAC4EBDAC4EBD9C2
      EBDAC2EBD9C2EEDEC5E3CFB8734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF8E5D59E5D1C6F4EADAEFE3D4EFE2D1EEE1CFEEDECCED
      DDCAEBDCC6EADAC4EADAC4EBD9C2EEDDC5E3CFB8734241FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0675BE6D4CBF7EEE1F7D4B1FAC7
      98FAC99CF8C79AF8C99AF8C799F7C798F8C695F2CFABEDE0C7E3CFB8734241FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0675BE6D8CF
      F7EFE5F6DCC1F8D1AFF7D3B0F7D1AFF6D1ACF6D1ABF4D0AAF6CFA6F0D4B5EEDE
      C7E3CFB8734241FF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E
      5D59A0675BE9DAD1F8F2E9F3E9D9F3E3D3F3E3D1F2E1CFF2E0CCF2DECAF0DDC7
      EFDCC4EEDCC5F0E1CBE3D0BB80504BFF00FFFF00FF8E5D59E6D4C4F7EBD7F3E5
      CFF2E3CEF2E2CAF0E1C7A7756BEBDED7FBF6EFFAD4ADFCC28BFCC590FCC590FC
      C48FFCC48FFCC48FFCC28BF4D0ACF0E5D3E6D1BF80504BFF00FFFF00FF8E5D59
      E3D0C2F4E7D5EFE0CEEEE0CCEEDECAEDDCC7A7756BEEE1D9FCF7F0F7EADCF8E6
      D4F6E5D3F6E3D0F6E2CEF4E1CBF4DECAF3DEC6F2E0CBF2E5D3E7D5C280504BFF
      00FFFF00FF8E5D59E5D1C6F4EADAEFE3D4EFE2D1EEE1CFEEDECCBC8268EFE5DD
      FCFBF6FAE9D8F8E1C9F8E1C9F6DEC7F6DEC4F6DDC4F6DCC1F6D9BDF3DEC9F3E7
      D8E7D8C78E5D59FF00FFFF00FFA0675BE6D4CBF7EEE1F7D4B1FAC798FAC99CF8
      C79ABC8268F3E9E3FEFFFEFCD7B5FCC28CFCC591FCC592FCC591FCC591FCC590
      FCC28CF7D5B4F7EEE2EBDCCC8E5D59FF00FFFF00FFA0675BE6D8CFF7EFE5F6DC
      C1F8D1AFF7D3B0F7D1AFD1926DF6EDE7FFFFFFFCF7F2FAF3EDFAF2E9F8EFE7F8
      EEE5F7EDE3F6EBE0F6EBDEF7EDE0F3EADED1C5BB8E5D59FF00FFFF00FFA0675B
      E9DAD1F8F2E9F3E9D9F3E3D3F3E3D1F2E1CFD1926DF6EEEAFFFFFFFFFFFFFEFC
      FCFBFAF7FAF7F4FAF6F3F7F4F0F8F4EEFBF7F2E9E5E0C9C7C4ACA7A79F675BFF
      00FFFF00FFA7756BEBDED7FBF6EFFAD4ADFCC28BFCC590FCC590DA9D75F7EFEA
      FFFFFFFFFFFFFFFEFEFFFCFAFCF8F6FBF7F2FBF8F3F2E7E19F675B9F675B9F67
      5B9F675B9F675BFF00FFFF00FFA7756BEEE1D9FCF7F0F7EADCF8E6D4F6E5D3F6
      E3D0DA9D75F8EFEAFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEFBF7FFFFFCE9D9D7
      9F675BD9995CE79740DC832AA5686BFF00FFFF00FFBC8268EFE5DDFCFBF6FAE9
      D8F8E1C9F8E1C9F6DEC7E7AB79FAF2EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFE9DDDD9F675BEEB164EB9E43A5686BFF00FFFF00FFFF00FFBC8268
      F3E9E3FEFFFEFCD7B5FCC28CFCC591FCC592E7AB79FAF3EEFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFEBE0E19F675BD99F64A5686BFF00FFFF00FFFF
      00FFFF00FFD1926DF6EDE7FFFFFFFCF7F2FAF3EDFAF2E9F8EFE7E7AB79D1926D
      D1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926D9F675BA5686BFF00
      FFFF00FFFF00FFFF00FFFF00FFD1926DF6EEEAFFFFFFFFFFFFFEFCFCFBFAF7FA
      F7F4FAF6F3F7F4F0F8F4EEFBF7F2E9E5E0C9C7C4ACA7A79F675BFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDA9D75F7EFEAFFFFFFFFFF
      FFFFFEFEFFFCFAFCF8F6FBF7F2FBF8F3F2E7E19F675B9F675B9F675B9F675B9F
      675BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDA9D75
      F8EFEAFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEFBF7FFFFFCE9D9D79F675BD999
      5CE79740DC832AA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFE7AB79FAF2EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      E9DDDD9F675BEEB164EB9E43A5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFE7AB79FAF3EEFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFEBE0E19F675BD99F64A5686BFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD192
      6DD1926DD1926DD1926DD1926DD1926DD1926D9F675BA5686BFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object BitBtn2: TBitBtn
    Left = 472
    Top = 288
    Width = 81
    Height = 33
    Caption = 'Enviar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000CD9A99CB9999
      C99493C99493C99493C99493C99493C99493C99493C99493C99493C99493C994
      93C99493C99493C99493C99493C99493C99493C99493C99493C99493C99493C9
      9493CD9A99CB9999E2B19BFFD59FFFD29EFFD19EFFD19EFFD19EFFD19EFFD19E
      FFD19EFFD19EFFD19EFFD19EFFD19EFFD19EFFD19EFFD19EFFD19EFFD29EFFD0
      9ED7A59ACA9799C99493CD9A99E0AE9BCF9E99E7BBA4FDD7AEFAD3ACFAD3ACFA
      D3ACFAD3ACFAD3ACFAD3ACFAD3ACFAD3ACFAD3ACFAD3ACFAD3ACFAD3ACFAD3AC
      FAD3ACFDD7AEE1B5A2CF9C99D8A89DC99493C99798E8BBA1E2B29DCB9A9AF3D2
      B5F9DBB9F7D8B8F7D8B8F7D8B8F7D8B8F7D8B8F7D8B8F7D8B8F7D8B8F7D8B8F7
      D8B8F7D8B8F7D8B8F9DBB9EDC9B1CB9999E9BDA4E5BBA6C99493C99696E2BDAD
      F9D5B0D5A197D9B1A8F6E0C7F5DEC6F4DDC5F4DDC5F4DDC5F4DDC5F4DDC5F4DD
      C5F4DDC5F4DDC5F4DDC5F4DDC5F5DEC6F1D7C2CFA09ED8A89DFADFC0E1BDB0C9
      9493C99594DEBEB6F9E4CAF1C7A7CD9997E3C6BCF3E4D3F1E1D1F1E1D1F1E1D1
      F1E1D1F1E1D1F1E1D1F1E1D1F1E1D1F1E1D1F1E1D1F4E6D4DDBBB3CC9794EDCC
      B5F6E8D5DEBEB6C99493C99594DEC0BAF3EADDF7DFC4E0B09DCB9C9CEDDFD5F1
      E8DCF0E5D9F0E5DAF0E5DAF0E5DAF0E5DAF0E5DAF0E5DAF0E5D9F1EADDE5D0C7
      CB9897E6C0ACF4E6D4F2EBDFDEC0BAC99493C99594DFC2BEF6F0E7F5E9DCF5D4
      B7D4A094D8B5B2F1E9E0F3EBE2F3EBE2F3EBE2F3EBE2F3EBE2F3EBE2F3EBE2F4
      EDE4F1E6DECFA2A1D7A79DF6E4D1F4EBE2F6F0E7DFC2BEC99493C99493E1C5C2
      F9F6EFF6F0EAFAECDBF5CEB0C69490DDC5C2F9F5EEF7F1EAF7F1EAF7F1EAF7F1
      EAF7F1EAF7F1EAF7F1EADAB7B5CF9A94F2D8C5F8F3EAF6F0EAFAF6EFE1C5C2C9
      9493C99493E3C8C5FCFCF6FAF7F3FBF7F1F1D6C5CF9B93CB9897D7B0AED8B2AF
      D8B1AFD8B1AFD8B2AFD8B1AFD8B0AED3A6A4C89090DCB2ABF9F0E6FBFAF5F9F6
      F0FCFCF6E3C8C5C99493C99392E5CBCAFFFFFFFDFCF9DFC0BEC99493D3A9A9E1
      C8C8D3A9A9CC9B9ACD9C9CCD9C9CCC9C9BCD9D9DD1AAA9DAC5C4D7BAB9CB9595
      D5A9A8F3E7E5FFFFFFFFFFFFE5CBCAC99493C99392E8D1D0F4E9E9D7AFAECB98
      97E0C3C3F6F5F4FCFFFFF7FCFDF3F8F9F3F8F9F1F8F9F1F8F9EEF8F9EEFCFCF1
      FFFFEEFFFFE0D8D7CFA8A7CC9796E2C5C4FCF9F9E8D1D0C99493CB9797D9B1B0
      D19D9CCE9D9DEEE0E0FFFFFFFCFFFFF9FFFFF9FFFFF6FFFFF6FFFFF3FFFFF3FF
      FFF1FFFFEEFFFFEEFFFFEDFFFFEEFFFFE9F7F7D5BBBBC99594D5A9A8DAB7B5C9
      9493CD9A99C69898C9C4C6F9F5F5FFFFFFFCFFFFFBFFFFF9FFFFF9FFFFF6FFFF
      F5FFFFF3FFFFF1FFFFF1FFFFEEFFFFEEFFFFEDFFFFEDFFFFEDFFFFEDFFFFE4EA
      EAD7B8B7CD9A99C99493CF9695B5B1B4B2FDFFFFFFFFFEFFFFFCFFFFFBFFFFF9
      FFFFF9FFFFF6FFFFF5FFFFF3FFFFF3FFFFF5FFFFF3FFFFF5FFFFF3FFFFEEFFFF
      E9FAFBE4F7F8DAF2F5C7E6EABFB2B4C99493CE9997BDA6A8BEEAEEFFFFFFFEFF
      FFFCFFFFFCFFFFFBFFFFFCFFFFFCFFFFFCFFFFF5FFFFEEF8F9DDEDEECFE3E5C0
      D8DDB4CFD5A6C4CF9BBBC88CB2C386B1C597A4B0B7989AC99493FF00FFCA9392
      C99594FFFFFFFFFFFFFCFFFFF9FFFFF0FBFCDEEFF0CEE6E8C0DFE2A8D3D88EC2
      C986BFC985C1CD83C2D382C3D686C6DE87CAE68BCDEBA7B7C9CB9897CD9997FF
      00FFFF00FFFF00FFCF9695C99594B5B3B6ACF7FF9DF9FF91EBF589DDE686DCE6
      82E0E985E5EF89EBF68BECFA8DE9F98EE6F98FE4FA8CE4FD93D8F1BBACB4CE99
      97CD9998FF00FFFF00FFFF00FFFF00FFFF00FFC99594C89694B5B3B696E3EB89
      F6FF8BF4FF8DF3FF8DF4FF8DF4FF8DF4FF8DF3FF8EF0FD8DEDFE8CEBFE9ED0E0
      C0A8ADD09794FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFCF9695CC9B9AAEC5C98CF6FF8AF8FF8DF4FF8DF3FF8DF3FF8BF4FF8AF8FF8F
      EDFAB2BCC2CD9998CF9695FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFCD9997CE9796BAB5B89BE0E78BF7FF89F9FF89F9
      FF8DF4FF9BE1E8BEB0B1D09593CD9998FF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD09593CB9C9B
      B9B5B7AEC5C9AEC5C9BDB0B1CB9A9ACF9695FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFCD9998CF9695D09593D09593CF9695FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object BitBtn3: TBitBtn
    Left = 360
    Top = 288
    Width = 81
    Height = 33
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = BitBtn3Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0077FF77FF700F
      77FFFF77FF77F0B0FF7777FF77FF70B307FF00000007F0B330007777770000B3
      307777770708800330777770070880F030777702070880033077702A000000B3
      307702AAAAAAA0B3307770AA000000B33077770A070880B330777770070880BB
      307777770708880BB077777777088880B0777777770000000077}
  end
  object Edit1: TEdit
    Left = 88
    Top = 16
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 184
    Top = 16
    Width = 81
    Height = 21
    TabOrder = 1
  end
  object DataSource1: TDataSource
    Left = 24
    Top = 280
  end
end
