class PagesController < ApplicationController
  def home
  end

  def work
  end

  def about
  end

  def contact
  end
  
  def case_study
    @slug = params[:slug]
    
    # Define all case studies data
    @case_studies = {
      'polegatch-ride' => {
        title: 'Polegatch Ride',
        category: 'SaaS',
        description: 'Plataforma de coaching de ciclismo',
        overview: 'Plataforma completa para treinamento de ciclismo, conectando coaches e atletas. Sistema de planos de treino personalizados, análise de performance e pagamentos integrados.',
        challenge: 'Criar uma plataforma que facilitasse a comunicação entre coaches e atletas, permitindo gestão de treinos, análise de métricas e processamento de pagamentos de forma integrada.',
        solution: 'Desenvolvemos uma aplicação web completa com Rails e React, integrando Stripe para pagamentos, dashboard analítico para coaches e interface mobile-friendly para atletas.',
        results: ['Mais de 500 usuários ativos', '95% de satisfação dos coaches', 'Processamento de R$ 50k/mês em assinaturas'],
        technologies: ['Ruby on Rails', 'React', 'PostgreSQL', 'Stripe API', 'Tailwind CSS'],
        url: nil
      },
      'madonna-cafe' => {
        title: 'Madonna Cafe',
        category: 'Landing Page',
        description: 'Site moderno para cafeteria premium',
        overview: 'Website institucional elegante para cafeteria premium, destacando produtos especiais, história da marca e ambiente acolhedor.',
        challenge: 'Criar uma presença digital que refletisse a qualidade premium e atmosfera aconchegante da cafeteria, com foco em experiência visual e performance.',
        solution: 'Landing page otimizada com design minimalista, galeria de fotos profissionais, cardápio interativo e integração com redes sociais.',
        results: ['40% aumento em visitantes', 'Tempo médio de 3min por sessão', '90+ score no Lighthouse'],
        technologies: ['Next.js', 'Tailwind CSS', 'Cloudinary', 'Google Analytics'],
        url: nil
      },
      'aasports' => {
        title: 'aasports',
        category: 'E-commerce',
        description: 'Loja online de pinturas esportivas personalizadas',
        overview: 'E-commerce especializado em pinturas customizadas para equipamentos esportivos, com sistema de personalização visual e checkout otimizado.',
        challenge: 'Desenvolver uma experiência de compra que permitisse aos clientes visualizar e personalizar pinturas em tempo real, mantendo performance e conversão alta.',
        solution: 'Plataforma Shopify customizada com ferramenta de visualização 3D, sistema de orçamento automático e integração com fornecedores.',
        results: ['150+ pedidos/mês', 'Taxa de conversão de 3.2%', '4.8★ avaliação média'],
        technologies: ['Shopify', 'Liquid', 'JavaScript', 'Three.js', 'Klaviyo'],
        url: nil
      },
      'watchbikes' => {
        title: 'watchbikes',
        category: 'E-commerce',
        description: 'E-commerce de bikes e serviços de mecânica',
        overview: 'Plataforma híbrida combinando e-commerce de bikes e peças com agendamento de serviços de mecânica.',
        challenge: 'Unificar venda de produtos físicos com agendamento de serviços, gestão de estoque e calendário de mecânicos em uma única plataforma.',
        solution: 'Sistema customizado integrando WooCommerce para produtos com sistema próprio de agendamentos e CRM para gestão de clientes.',
        results: ['R$ 200k+ em vendas mensais', '300+ agendamentos/mês', 'Redução de 60% em processos manuais'],
        technologies: ['WordPress', 'WooCommerce', 'PHP', 'MySQL', 'Custom Booking System'],
        url: nil
      },
      'treino-facil' => {
        title: 'Treino Fácil',
        category: 'App',
        description: 'Aplicativo de treino para ciclistas',
        overview: 'Aplicativo mobile para ciclistas planejarem treinos, registrarem atividades e acompanharem evolução de performance.',
        challenge: 'Criar experiência móvel fluida com sincronização em tempo real, funcionamento offline e integração com sensores de ciclismo.',
        solution: 'App nativo com React Native, banco de dados local com sincronização cloud, integração Bluetooth com sensores e gamificação.',
        results: ['10k+ downloads', '4.6★ na App Store', 'Uso médio de 45min/semana'],
        technologies: ['React Native', 'Firebase', 'Bluetooth API', 'Redux', 'Expo'],
        url: nil
      },
      'werace' => {
        title: 'werace',
        category: 'SaaS',
        description: 'Marketplace de compartilhamento de bikes',
        overview: 'Plataforma tipo Airbnb para aluguel de bicicletas entre pessoas, com sistema de reservas, pagamentos e avaliações.',
        challenge: 'Construir marketplace bilateral com confiança entre usuários, sistema de pagamentos escalonado e gestão de disponibilidade em tempo real.',
        solution: 'Aplicação Rails com sistema de verificação de usuários, pagamentos via Stripe Connect, calendário de disponibilidade e chat integrado.',
        results: ['500+ bikes cadastradas', 'R$ 80k em transações', 'Crescimento de 30% mês a mês'],
        technologies: ['Ruby on Rails', 'Stripe Connect', 'ActionCable', 'PostgreSQL', 'AWS S3'],
        url: nil
      },
      'almora-botanica' => {
        title: 'Almora Botânica',
        category: 'E-commerce',
        description: 'E-commerce de cosméticos naturais',
        overview: 'Loja online premium para cosméticos naturais, com foco em storytelling da marca, educação sobre ingredientes e experiência de compra sofisticada.',
        challenge: 'Criar e-commerce que transmitisse valores de sustentabilidade e qualidade premium, com conteúdo educacional e experiência de compra diferenciada.',
        solution: 'Shopify customizado com tema próprio, blog integrado, quiz de produtos personalizado e sistema de assinatura recorrente.',
        results: ['200+ clientes recorrentes', 'Ticket médio de R$ 280', 'NPS de 85'],
        technologies: ['Shopify', 'Custom Theme', 'Recharge', 'Klaviyo', 'Google Optimize'],
        url: nil
      },
      'associacao-kb' => {
        title: 'Associação KB',
        category: 'Landing Page',
        description: 'Site institucional para óleos CBD',
        overview: 'Website institucional educativo sobre óleos CBD, com foco em compliance regulatório, informações científicas e transparência.',
        challenge: 'Criar presença digital informativa e confiável para mercado altamente regulamentado, balanceando design moderno com credibilidade científica.',
        solution: 'Site com seções educacionais, biblioteca de estudos científicos, FAQ completo, certificações visíveis e otimização SEO para termos técnicos.',
        results: ['5k+ visitantes orgânicos/mês', 'Posição #1 para termos-chave', 'Taxa de rejeição < 20%'],
        technologies: ['Next.js', 'MDX para conteúdo', 'SEO otimizado', 'Tailwind CSS'],
        url: nil
      }
    }
    
    @case_study = @case_studies[@slug]
    
    # Redirect to work page if case study not found
    redirect_to work_path unless @case_study
  end
end
