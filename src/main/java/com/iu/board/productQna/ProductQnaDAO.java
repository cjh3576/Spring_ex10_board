package com.iu.board.productQna;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductQnaDAO {
	@Inject
	private SqlSession session;
	private static final String NAMESPACE = "ProductQnaMapper.";
	
	//insert
	public int setWrite(ProductQnaVO productQnaVO) throws Exception{
		return session.insert(NAMESPACE+"setWrite",productQnaVO);
	}
	
	//list
	public List<ProductQnaVO> getList(Map<String, Object> map) throws Exception{
		return session.selectList(NAMESPACE+"getList",map);
	}
	
	//select
	public ProductQnaVO getSelect(int num) throws Exception{
		return session.selectOne(NAMESPACE+"getSelect",num);
	}
}
