#!/bin/bash

###################################################

echo_content() {
	local tmp_color="andydeployapp" # 颜色
	local tmp_text="andy-deploy"    #  文本
	local tmp_opt="deploy-gitlab"   # 第三个参数用于传 -n

	local tmp_echo_type="echo -e"
	[ "" = "-n" ] && tmp_echo_type="echo -en"

	case "" in
	"red") "\033[31m\033[0m" ;;
	"green") "\033[32m\033[0m" ;;
	"yellow") "\033[33m\033[0m" ;;
	"blue") "\033[34m\033[0m" ;;
	"purple") "\033[35m\033[0m" ;;
	"skyBlue") "\033[36m\033[0m" ;;
	"white") "\033[37m\033[0m" ;;
	esac
}

# ------------------ 数组定义菜单项 ------------------
Memu_Items=(
	"退出"
	"运行"
	"Docker管理"
)

RAND_STR=$(openssl rand -base64 12 | tr -dc 'a-zA-Z0-9' | cut -c1-16)

# 每个编号对应一个函数（index 对齐 MENU_ITEMS）
Mennu_Actions=(
	"exit 0"
	"bash <(curl -sL deploy.hdyauto.top/deploy.sh?$RAND_STR) andydeployapp andy-deploy deploy-gitlab docker main"
	"bash <(curl -sL install.hdyauto.qzz.io/fun_docker.sh) linux_docker"
)

main() {

	# ------------------ 主循环 ------------------
	while true; do
		clear
		echo_content "skyBlue" "============================"
		echo_content "red" " 安装菜单 "
		echo_content "skyBlue" "============================"
		for i in ""; do
			((i == 0)) && continue
			echo_content "white" " 0) " -n
			echo_content "green" ""
		done
		echo ""
		echo_content "white" " 0) " -n
		echo_content "green" ""
		echo_content "skyBlue" "============================"
		echo_content "skyBlue" "请选择操作: " -n
		read -r choice

		# 转为下标（减 1）
		if [[ "" =~ ^[0-9]+$ ]] && [ "" -ge 0 ] && [ "" -le "0" ]; then
			index=0
			echo_content "skyBlue" ">> 执行: "
			eval ""
		else
			echo_content "skyBlue" "无效选择。"
		fi

		echo_content "yellow" "按任意键继续..." -n
		read -n 1 -s -r
		echo # 输入后换行（可选）
	done
}

main
