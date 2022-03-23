# Git 관련 Command


Git 계정 정보 영구 저장


# 기존에 저장된 credential 정보가 있다면 아래 명령어 수행으로 해제
git config --unset credential.helper


# git Credential 정보 저장
git config credential.helper store





# Credential 정보를 특정 시간동안 임시로 저장 하는 방식

git config --unset credential.helper [이 과정의 경우 기존에 세팅된 credential.helper 데이터를 해제할 때만 사용한다.]
git config credential.helper cache
git config credential.helper 'cache --timeout 7200'  [초단위 이며, 필요에 따라 변경한다. Default는 900초]



# --global 옵션을 추가 하면 모든 Repository 에 적용 가능


