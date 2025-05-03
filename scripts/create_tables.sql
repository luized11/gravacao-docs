

CREATE TABLE users (
  id_users INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  senha_acessousuario VARCHAR(100) NOT NULL
);

CREATE TABLE endereco_equipe (
  id_enderecoequip INT AUTO_INCREMENT PRIMARY KEY,
  cep INT NOT NULL,
  endereco VARCHAR(255) NOT NULL
);

CREATE TABLE equipe_filmagem (
  id_equipe INT AUTO_INCREMENT PRIMARY KEY,
  senha_acessoequipe VARCHAR(100) NOT NULL,
  contato VARCHAR(100),
  id_enderecoequip INT,
  FOREIGN KEY (id_enderecoequip) REFERENCES endereco_equipe(id_enderecoequip)
);

CREATE TABLE localizacao (
  id_local INT AUTO_INCREMENT PRIMARY KEY,
  endereco_local VARCHAR(255) NOT NULL,
  cep VARCHAR(15) NOT NULL,
  id_users INT,
  id_equipe INT,
  FOREIGN KEY (id_users) REFERENCES users(id_users),
  FOREIGN KEY (id_equipe) REFERENCES equipe_filmagem(id_equipe)
);

CREATE TABLE pacote_filmagem (
  id_pacotefilmagem INT AUTO_INCREMENT PRIMARY KEY,
  valor DECIMAL(10,2) NOT NULL,
  duracao TIME NOT NULL
);

CREATE TABLE admin (
  id_admin INT AUTO_INCREMENT PRIMARY KEY,
  senha_acessoadmin VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  id_users INT,
  FOREIGN KEY (id_users) REFERENCES users(id_users)
);

CREATE TABLE pagamento (
  id_pagamentos INT AUTO_INCREMENT PRIMARY KEY,
  forma_pagamento VARCHAR(50) NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  id_users INT,
  FOREIGN KEY (id_users) REFERENCES users(id_users)
);

CREATE TABLE videos (
  id_videos INT AUTO_INCREMENT PRIMARY KEY,
  duracao TIME NOT NULL,
  data_video TIME NOT NULL,
  id_equipe INT,
  id_users INT,
  id_admin INT,
  FOREIGN KEY (id_equipe) REFERENCES equipe_filmagem(id_equipe),
  FOREIGN KEY (id_users) REFERENCES users(id_users),
  FOREIGN KEY (id_admin) REFERENCES admin(id_admin)
);

CREATE TABLE agendamentos (
  id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
  data_agendada DATE NOT NULL,
  horario TIME NOT NULL,
  id_users INT NOT NULL,
  id_equipe INT NOT NULL,
  id_local INT NOT NULL,
  id_pacotefilmagem INT NOT NULL,
  status VARCHAR(50) DEFAULT 'pendente',
  FOREIGN KEY (id_users) REFERENCES users(id_users),
  FOREIGN KEY (id_equipe) REFERENCES equipe_filmagem(id_equipe),
  FOREIGN KEY (id_local) REFERENCES localizacao(id_local),
  FOREIGN KEY (id_pacotefilmagem) REFERENCES pacote_filmagem(id_pacotefilmagem)
);

