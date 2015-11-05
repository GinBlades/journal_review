require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

  
  describe "Standard CRUD" do
    let(:instance_entry) { assigns(:entry) }
    let(:base_entry) { create(:entry) }
    let(:static_entry) { create(:entry, name: 'spec-entry') }
    let(:valid_attributes) { attributes_for(:entry, name: 'spec-entry') }
    let(:invalid_attributes) { attributes_for(:entry, name: nil) }
  
    describe "GET #index" do
      it "populates an array of all @entries" do
        second_entry = create :entry
        get :index
        expect(assigns(:entries)).to match_array([base_entry, second_entry])
      end
    end
  
    describe "GET show" do
      it "assigns the requested entry as @entry" do
        get :show, id: base_entry
        expect(instance_entry).to eq(base_entry)
      end
    end

    describe "GET new" do
      it "assigns a new entry as @entry" do
        get :new
        expect(instance_entry).to be_a_new(Entry)
      end
    end

    describe "GET edit" do
      it "assigns the requested entry as @entry" do
        get :edit, id: base_entry
        expect(instance_entry).to eq(base_entry)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Entry" do
          expect do
            post :create, entry: valid_attributes
          end.to change(Entry, :count).by(1)
        end

        it "assigns a newly created entry as @entry" do
          post :create, entry: valid_attributes
          expect(instance_entry).to be_a(Entry)
          expect(instance_entry).to be_persisted
        end

        it "redirects to the created entry" do
          post :create, entry: valid_attributes
          expect(response).to redirect_to(Entry.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved entry as @entry" do
          post :create, entry: invalid_attributes
          expect(instance_entry).to be_a_new(Entry)
        end

        it "re-renders the 'new' template" do
          post :create, entry: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested entry as @entry" do
          put :update, id: static_entry, entry: valid_attributes
          static_entry.reload
          expect(instance_entry).to eq(static_entry)
        end

        it "redirects to the entry" do
          put :update, id: static_entry, entry: valid_attributes
          expect(response).to redirect_to(static_entry)
        end
      end

      describe "with invalid params" do
        it "assigns the entry as @entry" do
          put :update, id: static_entry, entry: invalid_attributes
          expect(assigns(:entry)).to eq(static_entry)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_entry, entry: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested entry" do
        new_entry = create :entry
        expect do
          delete :destroy, id: new_entry
        end.to change(Entry, :count).by(-1)
      end

      it "redirects to the entry list" do
        delete :destroy, id: base_entry
        expect(response).to redirect_to(entries_url)
      end
    end
  end
end
