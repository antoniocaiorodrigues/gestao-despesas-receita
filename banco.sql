CREATE TABLE IF NOT EXISTS contas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(90) NOT NULL
);

CREATE TABLE IF NOT EXISTS transacoes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_conta INT NOT NULL,
  tipo ENUM('receita', 'despesa') NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  fonte VARCHAR(255),
  valor DECIMAL(10, 2) NOT NULL,
  data_lancamento DATE NOT NULL,
  data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_conta) REFERENCES contas(id)
);

INSERT INTO contas (nome) VALUES 
  ('Conta Corrente'),
  ('Conta Poupança');

INSERT INTO transacoes (id_conta, tipo, descricao, fonte, valor, data_lancamento) VALUES
  (1, 'receita', 'Salário', 'Empresa', 2000.00, '2024-06-01'),
  (1, 'despesa', 'Gasolina', 'Posto', 200.00, '2024-06-02'),
  (2, 'receita', 'Concerto de Notebook', 'Assistencia', 50.00, '2024-06-03'),
  (2, 'despesa', 'Conta de luz', 'Concessionária de Energia', 150.00, '2024-06-04');

SELECT t.id, c.nome AS conta, t.tipo, t.descricao, t.fonte, t.valor, t.data_lancamento, t.data_modificacao
FROM transacoes t
JOIN contas c ON t.id_conta = c.id;
