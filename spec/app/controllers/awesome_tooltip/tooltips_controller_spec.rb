require 'rails_helper'

RSpec.describe AwesomeTooltip::TooltipsController, type: :controller do
  routes { AwesomeTooltip::Engine.routes }

  render_views

  describe 'GET #show' do
    it 'renders template' do
      get :show, params: {
        template: 'test_template'
      }

      expect(response).to be_successful
      expect(response).to render_template('test_template')
    end

    it 'renders template with record' do
      create(:project)

      get :show, params: {
        template: 'project',
        object: 'project-1'
      }

      expect(response).to be_successful
      expect(response).to render_template('project')
    end

    it 'does not render template when it is located outside of awesome_tooltips and views paths' do
      expect do
        get :show, params: {
          template: '../testtemplate'
        }
      end.to raise_error(ActionView::MissingTemplate)
    end
  end
end
