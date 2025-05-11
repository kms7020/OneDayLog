function openAdminModal() {
  document.getElementById('adminPasswordModal').classList.remove('hidden');
  document.getElementById('adminPasswordModal').classList.add('show');
  document.getElementById('adminSecretInput').focus();
}

function closeAdminModal() {
  document.getElementById('adminPasswordModal').classList.remove('show');
  document.getElementById('adminPasswordModal').classList.add('hidden');
}

function checkAdminSecret() {
  const input = document.getElementById('adminSecretInput').value;
  if (input === 'kms7262') {  // 예시용 비밀번호
    location.href = 'adminLoginForm.action';
  } else {
    alert('비밀번호가 틀렸습니다.');
  }
}
