# terraform-home
1.  Terraformのインストール
```
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
tfenv install 1.3.9
tfenv use 1.3.9
terraform -v
```

1.  proxmoxのトークンIDとトークンシークレット、APIURLをBitwardenから取得し、変数定義ファイルを作成する
```
export PM_API_TOKEN_ID='<トークンID>'
export PM_API_TOKEN_SECRET='<トークンシークレット>'
export PM_API_URL='<ProxmoxURL>/api2/json'
```