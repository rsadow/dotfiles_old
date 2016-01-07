describe 'vspec'
    before
	put!= 'Welcome'
    end
    it 'something'
	Expect getline(1) == "Welcome"
	Expect pman#init() == "Init"
    end
end
