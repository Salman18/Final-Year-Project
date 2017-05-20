<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
                            int i = 1;
                            String f = null;
                            String r = null;

                            String get = request.getQueryString();
                            String[] arr = get.split(",");
                            String a = arr[0];
                            String b = arr[1];
                            System.out.println("user: "+a);
                            System.out.println("filename : "+b);

                            Connection conn = DbConnector.getConnection();
                            Statement st1 = conn.createStatement();
                            ResultSet rst = null;

                            int req = st1.executeUpdate("insert into request(user,filename)values('" + a + "','" + b + "')");
                            if (req != 0) {
                                System.out.println("request send..!");
                                response.sendRedirect("keyrequest.jsp?request_sent");
                            } else {
                                System.out.println("request send fails..!");
                                response.sendRedirect("keyrequest.jsp?request_failed");
                            }
                        %>