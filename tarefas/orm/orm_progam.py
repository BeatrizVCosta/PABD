from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.orm import sessionmaker, relationship, declarative_base

Base = declarative_base()

class Projeto(Base):
    __tablename__ = 'projeto'
    id = Column(Integer, primary_key=True)
    nome = Column(String)
    lider_id = Column(Integer)
    atividades = relationship("Atividade", back_populates="projeto")

class Atividade(Base):
    __tablename__ = 'atividade'
    id = Column(Integer, primary_key=True)
    nome = Column(String)
    descricao = Column(String)
    projeto_id = Column(Integer, ForeignKey('projeto.id'))
    projeto = relationship("Projeto", back_populates="atividades")

# Configuração do banco (ajuste usuário/senha/host/db)
engine = create_engine('postgresql://seu_usuario:sua_senha@localhost:5432/atividadesbd')
Session = sessionmaker(bind=engine)
session = Session()

# Inserir uma atividade
nova_atividade = Atividade(nome="Atividade Teste ORM", descricao="Descrição ORM", projeto_id=1)
session.add(nova_atividade)

# Atualizar líder de projeto
projeto = session.query(Projeto).filter_by(id=1).first()
if projeto:
    projeto.lider_id = 3

session.commit()

# Listar projetos e atividades
projetos = session.query(Projeto).all()
for p in projetos:
    print(f"Projeto {p.id} - {p.nome} | Líder {p.lider_id}")
    for a in p.atividades:
        print(f"  Atividade {a.id} - {a.nome}")

session.close()
